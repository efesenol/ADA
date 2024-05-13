//
//  IbanSayfasi.swift
//  ADA Project
//
//  Created by Efe Şenol on 25.03.2024.
//

import UIKit

class IbanSayfasi: UIViewController {

    @IBOutlet weak var bankaAdi: UILabel!
    @IBOutlet weak var IBAN: UILabel!
   
   
    var BankaAdi : String = ""
    var ibans : [String] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        // Geri düğmesini özelleştirme
            let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            backButton.tintColor = UIColor.white // Geri düğmesinin rengini beyaz yapın
            self.navigationItem.backBarButtonItem = backButton

        bankaAdi.text = BankaAdi
        IBAN.text = ibans.joined(separator: "\n")
        IBAN.isUserInteractionEnabled = true //Label tıklanabilir oldu
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        IBAN.addGestureRecognizer(tapGesture)
    }
    @objc func labelTapped (sender : UITapGestureRecognizer){
        if let label = sender.view as? UILabel {
            UIPasteboard.general.string = label.text
            print("Metin kopyalandı : \(label.text ?? "")")
            
            // Bildirim oluştur
                        let alert = UIAlertController(title: "Metin Kopyalandı", message: "Metin panoya kopyalandı.", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
                        alert.addAction(okAction)
                        present(alert, animated: true, completion: nil)
                }
        }
        
    }
    

    
    

  


