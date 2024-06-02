//
//  AyarlarSayfası.swift
//  ADA Project
//
//  Created by Efe Şenol on 25.02.2024.
//

import UIKit
import Firebase


class AyarlarSayfasi: UIViewController {

 
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        

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
    
  

}
