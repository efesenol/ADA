import UIKit
import GoogleMaps
import CoreLocation

class HaritalarSayfasi: UIViewController,CLLocationManagerDelegate,GMSMapViewDelegate {

    var mapView: GMSMapView!
    var hospitalButton: UIButton!
    var pharmacyButton: UIButton!
    var gatheringAreaButton: UIButton!
    var hospitalMarkers: [GMSMarker] = []
    var pharmacyMarkers: [GMSMarker] = []
    var gatheringAreaMarkers: [GMSMarker] = []
    var isHospitalsAdded = false
    var isPharmaciesAdded = false
    var isGatheringAreasAdded = false
    var currentPolyline: GMSPolyline?
    
    var isFirstLocationUpdate = true
    var locationManager : CLLocationManager!
    var userMarker : GMSMarker!
    var userLocation: CLLocationCoordinate2D!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        // Harita görünümünü oluştur
        let camera = GMSCameraPosition.camera(withLatitude: 38.9637, longitude: 35.2433, zoom: 7.0) // Türkiye'nin orta noktası ve daha geniş bir zoom
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
        view = mapView
        
        // Konum yöneticisini başlat
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        // Hastane butonunu oluştur
        hospitalButton = UIButton(type: .custom)
        hospitalButton.addTarget(self, action: #selector(toggleHospitals), for: .touchUpInside)
        hospitalButton.frame = CGRect(x: 20, y: 750, width: 40, height: 40)
        hospitalButton.setImage(UIImage(named: "Hastane Logo"), for: .normal) // Hastane logosunu ekleyin
        //hospitalButton.layer.cornerRadius = 20
        hospitalButton.clipsToBounds = true
        mapView.addSubview(hospitalButton)
        
        // Eczane butonunu oluştur
        pharmacyButton = UIButton(type: .custom)
        pharmacyButton.addTarget(self, action: #selector(togglePharmacies), for: .touchUpInside)
        pharmacyButton.frame = CGRect(x: 70, y: 750, width: 40, height: 40)
        pharmacyButton.setImage(UIImage(named: "Eczane Logo"), for: .normal) // Eczane logosunu ekleyin
        //pharmacyButton.layer.cornerRadius = 20
        pharmacyButton.clipsToBounds = true
        mapView.addSubview(pharmacyButton)

        // Toplanma Alanları butonunu oluştur
        gatheringAreaButton = UIButton(type: .custom)
        gatheringAreaButton.addTarget(self, action: #selector(toggleGatheringAreas), for: .touchUpInside)
        gatheringAreaButton.frame = CGRect(x: 120, y: 750, width: 40, height: 40)
        gatheringAreaButton.setImage(UIImage(named: "ToplanmaAlanı Logo"), for: .normal) // Toplanma alanı logosunu ekleyin
        //gatheringAreaButton.layer.cornerRadius = 20
        gatheringAreaButton.clipsToBounds = true
        mapView.addSubview(gatheringAreaButton)
    }
    
    @objc func toggleHospitals() {
        if isHospitalsAdded {
            removeMarkers(type: "hospital")
        } else {
            addMarkers(type: "hospital")
        }
    }
    
    @objc func togglePharmacies() {
        if isPharmaciesAdded {
            removeMarkers(type: "pharmacy")
        } else {
            addMarkers(type: "pharmacy")
        }
    }
    
    @objc func toggleGatheringAreas() {
        if isGatheringAreasAdded {
            removeMarkers(type: "gatheringArea")
        } else {
            addMarkers(type: "gatheringArea")
        }
    }
    
    func addMarker(latitude: Double, longitude: Double, name: String,iconName: String) -> GMSMarker {
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        marker.title = name
        marker.icon = resizeImage(image: UIImage(named: iconName)!, targetSize: CGSize(width: 30, height: 30)) // Marker için yeniden boyutlandırılmış ikon ayarla
        marker.map = mapView
        marker.map = mapView
        return marker
    }
    
    func addMarkers(type: String) {
        fetchData(type: type)
        if type == "hospital" {
            isHospitalsAdded = true
        } else if type == "pharmacy" {
            isPharmaciesAdded = true
        } else if type == "gatheringArea" {
            isGatheringAreasAdded = true
        }
    }
    
    func removeMarkers(type: String) {
        if type == "hospital" {
            for marker in hospitalMarkers {
                marker.map = nil
            }
            hospitalMarkers.removeAll()
            isHospitalsAdded = false
        } else if type == "pharmacy" {
            for marker in pharmacyMarkers {
                marker.map = nil
            }
            pharmacyMarkers.removeAll()
            isPharmaciesAdded = false
        } else if type == "gatheringArea" {
            for marker in gatheringAreaMarkers {
                marker.map = nil
            }
            gatheringAreaMarkers.removeAll()
            isGatheringAreasAdded = false
        }
    }
    
    func fetchData(type: String) {
        var urlString = ""
        let apiKey = "AIzaSyDxpYVYnvEmLLoVVRpxsPWWR_jWQV6MCFQ"
        
        if type == "hospital" {
            urlString = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=39.9334,32.8597&radius=1500000&type=hospital&key=\(apiKey)" // Türkiye'nin orta noktası ve 1500 km yarıçap
        } else if type == "pharmacy" {
            urlString = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=39.9334,32.8597&radius=1500000&type=pharmacy&key=\(apiKey)" // Türkiye'nin orta noktası ve 1500 km yarıçap
        } else if type == "gatheringArea" {
            // Ankara'nın koordinatları ile toplanma alanlarını sorgulama
            urlString = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=39.9334,32.8597&radius=5000&keyword=park&key=\(apiKey)"
        }
        
        guard let url = URL(string: urlString) else {
            print("URL oluşturulamadı.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Veri alınamadı: \(error?.localizedDescription ?? "Bilinmeyen hata")")
                return
            }
            
            do {
                // JSON'dan veriyi çöz
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    // JSON'daki verileri işle
                    if let results = json["results"] as? [[String: Any]] {
                        for result in results {
                            if let geometry = result["geometry"] as? [String: Any], let location = geometry["location"] as? [String: Any] {
                                if let latitude = location["lat"] as? Double, let longitude = location["lng"] as? Double {
                                    // Her hastane/eczane/toplanma alanı için koordinatları al
                                    DispatchQueue.main.async {
                                        if type == "hospital" {
                                            let marker = self.addMarker(latitude: latitude, longitude: longitude, name: "Hastane",iconName: "Hastane Logo")
                                            self.hospitalMarkers.append(marker)
                                        } else if type == "pharmacy" {
                                            let marker = self.addMarker(latitude: latitude, longitude: longitude, name: "Eczane",iconName: "Eczane Logo")
                                            self.pharmacyMarkers.append(marker)
                                        } else if type == "gatheringArea" {
                                            let marker = self.addMarker(latitude: latitude, longitude: longitude, name: "Toplanma Alanı",iconName: "ToplanmaAlanı Logo")
                                            self.gatheringAreaMarkers.append(marker)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            } catch let error {
                print("JSON hata: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
           let size = image.size
           
           let widthRatio  = targetSize.width  / size.width
           let heightRatio = targetSize.height / size.height
           
           // Determine what scale factor to use
           var newSize: CGSize
           if(widthRatio > heightRatio) {
               newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
           } else {
               newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
           }
           
           // Create a new rectangle with the new size
           let rect = CGRect(origin: .zero, size: newSize)
           
           // Draw the image in the new size
           UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
           image.draw(in: rect)
           let newImage = UIGraphicsGetImageFromCurrentImageContext()
           UIGraphicsEndImageContext()
           
           return newImage!
       }
    // CLLocationManagerDelegate fonksiyonları
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.last else { return }
                
                let userLocation = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
                
                if userMarker == nil {
                    userMarker = GMSMarker()
                    userMarker.position = userLocation
                    userMarker.title = "Mevcut Konum"
                    userMarker.icon = GMSMarker.markerImage(with: .blue)
                    userMarker.map = mapView
                } else {
                    userMarker.position = userLocation
            }
            // Haritayı sadece ilk konum güncellemesinde kullanıcı konumuna odakla
                if isFirstLocationUpdate {
                    let camera = GMSCameraPosition.camera(withLatitude: userLocation.latitude, longitude: userLocation.longitude, zoom: 15.0)
                    mapView.animate(to: camera)
                    isFirstLocationUpdate = false
                }
        }
        
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("Konum güncellenemedi: \(error.localizedDescription)")
        }
    // GMSMapViewDelegate fonksiyonları
       func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
           if let userLocation = locationManager.location?.coordinate {
               let destination = marker.position
               drawRoute(from: userLocation, to: destination)
              }
           return true
       }
    //Rota çizme
    func drawRoute(from origin: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D) {
        let apiKey = "AIzaSyDxpYVYnvEmLLoVVRpxsPWWR_jWQV6MCFQ"
        let originString = "\(origin.latitude),\(origin.longitude)"
        let destinationString = "\(destination.latitude),\(destination.longitude)"
        
        let urlString = "https://maps.googleapis.com/maps/api/directions/json?origin=\(originString)&destination=\(destinationString)&key=\(apiKey)"
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching directions: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    if let routes = json["routes"] as? [[String: Any]], let route = routes.first {
                        if let overviewPolyline = route["overview_polyline"] as? [String: Any], let points = overviewPolyline["points"] as? String {
                            DispatchQueue.main.async {
                                // Eski polyline'ı kaldır
                                self.currentPolyline?.map = nil
                                self.drawPath(from: points)
                            }
                        }
                    }
                }
            } catch {
                print("Error parsing directions JSON: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }

       
       // Polylines ekleyerek rotayı çiz
       func drawPath(from points: String) {
           let path = GMSPath(fromEncodedPath: points)
           let polyline = GMSPolyline(path: path)
           polyline.strokeColor = .blue
           polyline.strokeWidth = 4.0
           polyline.map = mapView
           // Çizilen polyline'ı sakla
           currentPolyline = polyline
       }
   }

