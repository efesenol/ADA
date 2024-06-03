//
//  AyarlarSayfası.swift
//  ADA Project
//
//  Created by Efe Şenol on 25.02.2024.
//

import UIKit
import Firebase


class AyarlarSayfasi: UIViewController {

 
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        loadProfileData()

        // Geri düğmesini özelleştirme
            let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            backButton.tintColor = UIColor.white // Geri düğmesinin rengini beyaz yapın
            self.navigationItem.backBarButtonItem = backButton
      

    }
    @IBAction func cikisYapButton(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "girisYap11", sender: nil)
        }catch{
            
        }
    }
  
    @IBAction func BildirimlerButton(_ sender: Any) {
        performSegue(withIdentifier: "Bildirimler", sender: nil)
    }
    @IBAction func saveButton(_ sender: Any) {
        saveProfileData()
        print("tıklandı")
        
    }
    func saveProfileData() {
            let name = nameTextField.text ?? ""
            let surname = surnameTextField.text ?? ""
            let phoneNumber = phoneNumber.text ?? ""

            UserDefaults.standard.set(name, forKey: "name")
            UserDefaults.standard.set(surname, forKey: "surname")
            UserDefaults.standard.set(phoneNumber, forKey: "phoneNumber1")
        }
    func loadProfileData() {
            let name = UserDefaults.standard.string(forKey: "name") ?? ""
            let surname = UserDefaults.standard.string(forKey: "surname") ?? ""
            let phoneNumber1 = UserDefaults.standard.string(forKey: "phoneNumber1") ?? ""

            nameTextField.text = name
            surnameTextField.text = surname
            phoneNumber.text = phoneNumber1
        }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { //Klavyenin kapanmasını sağlar
        self.view.endEditing(true)
    }
}
