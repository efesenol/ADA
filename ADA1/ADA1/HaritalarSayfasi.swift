import UIKit
import GoogleMaps

class HaritalarSayfasi: UIViewController {

    var mapView: GMSMapView!
    var hospitalButton: UIButton!
    var pharmacyButton: UIButton!
    var zoomOutButton: UIButton!
    var hospitalMarkers: [GMSMarker] = []
    var pharmacyMarkers: [GMSMarker] = []
    var isHospitalsAdded = false
    var isPharmaciesAdded = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        
        // Harita görünümünü oluştur
        let camera = GMSCameraPosition.camera(withLatitude: 38.9637, longitude: 35.2433, zoom: 7.0) // Türkiye'nin orta noktası ve daha geniş bir zoom
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        view = mapView
        
        // Hastane butonunu oluştur
        hospitalButton = UIButton(type: .system)
        hospitalButton.setTitle("Hastaneleri Ekle", for: .normal)
        hospitalButton.addTarget(self, action: #selector(toggleHospitals), for: .touchUpInside)
        hospitalButton.frame = CGRect(x: 16, y: 700, width: 160, height: 40)
        hospitalButton.setTitleColor(.red, for: .normal)
        hospitalButton.backgroundColor = .white
        hospitalButton.layer.cornerRadius = 15
        mapView.addSubview(hospitalButton)
        
        // Eczane butonunu oluştur
        pharmacyButton = UIButton(type: .system)
        pharmacyButton.setTitle("Eczaneleri Ekle", for: .normal)
        pharmacyButton.addTarget(self, action: #selector(togglePharmacies), for: .touchUpInside)
        pharmacyButton.frame = CGRect(x: 16, y: 750, width: 160, height: 40)
        pharmacyButton.setTitleColor(.red, for: .normal)
        pharmacyButton.backgroundColor = .white
        pharmacyButton.layer.cornerRadius = 15
        mapView.addSubview(pharmacyButton)
      
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
    
  
    func addMarker(latitude: Double, longitude: Double, name: String) -> GMSMarker {
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        marker.title = name
        marker.map = mapView
       
              
        return marker
        
        func loadViewFromNib() -> UIView {
            let nib = UINib(nibName: "CustomMarkerView", bundle: nil)
            return nib.instantiate(withOwner: self, options: nil).first as! UIView
            }
    }
    
    func addMarkers(type: String) {
        fetchData(type: type)
        if type == "hospital" {
            isHospitalsAdded = true
            hospitalButton.setTitle("Hastaneleri Kaldır", for: .normal)
        } else if type == "pharmacy" {
            isPharmaciesAdded = true
            pharmacyButton.setTitle("Eczaneleri Kaldır", for: .normal)
        }
    }
    
    func removeMarkers(type: String) {
        if type == "hospital" {
            for marker in hospitalMarkers {
                marker.map = nil
            }
            hospitalMarkers.removeAll()
            isHospitalsAdded = false
            hospitalButton.setTitle("Hastaneleri Ekle", for: .normal)
        } else if type == "pharmacy" {
            for marker in pharmacyMarkers {
                marker.map = nil
            }
            pharmacyMarkers.removeAll()
            isPharmaciesAdded = false
            pharmacyButton.setTitle("Eczaneleri Ekle", for: .normal)
        }
    }
    
    func fetchData(type: String) {
        var urlString = ""
        if type == "hospital" {
            urlString = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=39.9334,32.8597&radius=1500000&type=AIzaSyDxpYVYnvEmLLoVVRpxsPWWR_jWQV6MCFQ" // Türkiye'nin orta noktası ve 1500 km yarıçap
        } else if type == "pharmacy" {
            urlString = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=39.9334,32.8597&radius=1500000&type=pharmacy&key=AIzaSyDxpYVYnvEmLLoVVRpxsPWWR_jWQV6MCFQ" // Türkiye'nin orta noktası ve 1500 km yarıçap
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
                                    // Her hastane/eczane için koordinatları al
                                    DispatchQueue.main.async {
                                        if type == "hospital" {
                                            let marker = self.addMarker(latitude: latitude, longitude: longitude, name: "Hastane")
                                            self.hospitalMarkers.append(marker)
                                        } else if type == "pharmacy" {
                                            let marker = self.addMarker(latitude: latitude, longitude: longitude, name: "Eczane")
                                            self.pharmacyMarkers.append(marker)
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
}
