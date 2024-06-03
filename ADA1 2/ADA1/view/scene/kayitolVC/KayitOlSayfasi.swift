//
//  KayıtOlSayfasi.swift
//  ADA Project
//
//  Created by Efe Şenol on 13.03.2024.
//

import UIKit
import Firebase
class KayitOlSayfasi: UIViewController {

    
    @IBOutlet weak var telefonNumarası: UITextField!
    @IBOutlet weak var sifre: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Geri düğmesini özelleştirme
            let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            backButton.tintColor = UIColor.white // Geri düğmesinin rengini beyaz yapın
            self.navigationItem.backBarButtonItem = backButton
        view.backgroundColor = UIColor.white


    }
    @IBAction func girisButton(_ sender: Any) {
        if telefonNumarası.text != nil {
            Auth.auth().createUser(withEmail: telefonNumarası.text!, password: sifre.text!) { data, error in
                if error != nil {
                    self.alertCreate(titleInput: "Hata", MessageInput: "Tekrar Deneyin")
                }else {
                    self.performSegue(withIdentifier: "TabBar", sender: nil)
                }
            }
        }
    }
    func alertCreate (titleInput : String, MessageInput : String) {
        let alert = UIAlertController(title: titleInput, message: MessageInput, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert,animated: true)
    }
    @IBAction func saveButton(_ sender: Any) {
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}
