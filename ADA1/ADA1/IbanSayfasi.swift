// IbanSayfasi.swift
import UIKit

class IbanSayfasi: UIViewController {
    
    var BankaAdi: String = ""
    var ibans: [String] = []

    @IBOutlet weak var TLLabel: UILabel!
    @IBOutlet weak var USDLabel: UILabel!
    @IBOutlet weak var EuroLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = BankaAdi
        view.backgroundColor = UIColor.white
        
        if ibans.count > 0 {
            TLLabel.text = ibans[0]
        }
        if ibans.count > 1 {
            USDLabel.text = ibans[1]
        }
        if ibans.count > 2 {
            EuroLabel.text = ibans[2]
        }
        addTapGesture(to: TLLabel)
        addTapGesture(to: USDLabel)
        addTapGesture(to: EuroLabel)
    }
    func addTapGesture(to label: UILabel) {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleLabelTap(_:)))
            label.isUserInteractionEnabled = true
            label.addGestureRecognizer(tapGesture)
        }
        
        @objc func handleLabelTap(_ sender: UITapGestureRecognizer) {
            if let label = sender.view as? UILabel, let text = label.text {
                UIPasteboard.general.string = text
                showCopyAlert()
            }
        }
        
        func showCopyAlert() {
            let alert = UIAlertController(title: nil, message: "Kopyalandı", preferredStyle: .alert)
            self.present(alert, animated: true)
            
            // 1 saniye sonra uyarıyı kapat
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                alert.dismiss(animated: true, completion: nil)
            }
        }
}
