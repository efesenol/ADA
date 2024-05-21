// BagisSayfasi.swift
import UIKit

class BagisSayfasi: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let bankalar = ["Vakıf Katılım Bankası", "Türkiye Emlak Katılım Bankası", "Albaraka Türk Katılım Bankası", "Denizbank", "Halkbank", "Ziraat Bankası", "Ziraat Katılım Bankası", "Türkiye İş Bankası", "Şekerbank", "Türkiye Ekonomi Bankası", "QNB Finansbank", "Akbank", "PTTBank", "Yapı ve Kredi Bankası", "Kuveyt Türk Katılım Bankası"]
    let ibanlar: [String : [String]] = [
        "Vakıf Katılım Bankası": ["TL: TR25 0021 0000 0001 6349 0000 06","USD: TR57 0021 0000 0001 6349 0001 09", "EURO: TR30 0021 0000 0001 6349 0001 10"],         "Türkiye Emlak Katılım Bankası": ["TL: TR80 0021 1000 0005 1027 4000 11", "USD: TR31 0021 1000 0005 1027 4001 17", "EURO: TR04 0021 1000 0005 1027 4001 18"],"Albaraka Türk Katılım Bankası": ["TL: TR02 0020 3000 0779 2009 0000 10","USD: TR72 0020 3000 0779 2009 0000 11","EURO: TR45 0020 3000 0779 2009 0000 12"],"Denizbank": ["TL: TR84 0013 4000 0155 9775 9000 11","USD: TR14 0013 4000 0155 9775 9000 10", "EURO: TR57 0013 4000 0155 9775 9000 12"],"Halkbank": ["TL: TR88 0001 2009 4080 0005 0002 28","USD: TR75 0001 2009 4080 0058 0002 92","EURO: TR48 0001 2009 4080 0058 0002 93"],"Ziraat Bankası": ["TL: TR73 0001 0017 4555 5555 5552 04", "USD: TR 46 0001 0017 4555 5555 5552 05","EURO: TR 19 0001 0017 4555 5555 5552 06","GBP: TR 43 0001 0017 4555 5555 5553 56"],"Ziraat Katılım Bankası": ["TL: TR70 0020 9000 0041 2303 0000 10","USD: TR43 0020 9000 0041 2303 0000 11","EURO: TR16 0020 9000 0041 2303 0000 12"],"Türkiye İş Bankası": ["TL: TR16 0006 4000 0014 2990 9890 45","USD: TR09 0006 4000 0024 2992 5862 71","EURO: TR19 0006 4000 0024 2992 5862 85", "CHF: TR98 0006 4000 0024 2992 6599 41","GBP: TR12 0006 4000 0024 2992 6599 37"],"Şekerbank": ["TL: TR18 0005 9000 6013 0006 0089 34", "USD: TR88 0005 9000 6013 0006 0089 35","EURO: TR61 0005 9000 6013 0006 0089 36"],"Türkiye Ekonomi Bankası": ["TL: TR90 0003 2000 0000 0077 3407 66", "USD: TR13 0003 2000 0000 0077 3407 94","EURO: TR34 0003 2000 0000 0077 3408 04"],"QNB Finansbank": ["TL: TR03 0011 1000 0000 0091 7684 68", "USD: TR48 0011 1000 0000 0091 7685 31","EURO: TR32 0011 1000 0000 0091 7686 25"],"Akbank": ["TL: TR83 0004 6008 3288 8000 1486 21","USD: TR07 0004 6008 3200 1000 1486 22","EURO: TR54 0004 6008 3203 6000 1486 23"],"PTTBank": ["TL: TR71 0080 7008 8130 0001 8660 01"],"Yapı ve Kredi Bankası": ["TL: TR76 0006 7010 0000 0032 7546 60","USD: TR79 0006 7010 0000 0032 7546 06","EUR: TR59 0006 7010 0000 0032 7545 78"],"Kuveyt Türk Katılım Bankası": ["TL:  TR67 0020 5000 0951 0603 5000 09", "USD:  TR61 0020 5000 0951 0603 5001 17", "EURO: TR34 0020 5000 0951 0603 5001 18"]]
    
    let bankLogos = [
        "VakifKatilim",
        "TurkiyeEmlak",
        "AlbarakaTurk",
        "Denizbank",
        "Halkbank",
        "Ziraat",
        "ZiraatKatilim",
        "IsBankasi",
        "Sekerbank",
        "TEB",
        "QNB",
        "Akbank",
        "PTTBank",
        "YapiKredi",
        "KuveytTurk"
    ]
    
    var güncelBankalar : String = ""

    @IBOutlet weak var BagısTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        // Geri düğmesini özelleştirme
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        backButton.tintColor = UIColor.white // Geri düğmesinin rengini beyaz yapın
        self.navigationItem.backBarButtonItem = backButton

        BagısTableView.dataSource = self
        BagısTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bankalar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BagisCell", for: indexPath)
        
        cell.textLabel?.text = bankalar[indexPath.row]
        cell.textLabel?.textColor = UIColor.black // Metin rengi siyah
        cell.backgroundColor = UIColor.white // Tableview arka plan beyaz
        // Banka logosunu ekleyin
        let logoName = bankLogos[indexPath.row]
        if let logoImage = UIImage(named: logoName) {
            cell.imageView?.image = logoImage
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        güncelBankalar = bankalar[indexPath.row]
        performSegue(withIdentifier: "IBAN", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? IbanSayfasi {
            destinationVC.BankaAdi = güncelBankalar
            destinationVC.ibans = ibanlar[güncelBankalar] ?? []
        }
    }
}
