//
//  AyarlarSayfası.swift
//  ADA Project
//
//  Created by Efe Şenol on 25.02.2024.
//

import UIKit

class AyarlarSayfasi: UIViewController {

 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        // Geri düğmesini özelleştirme
            let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            backButton.tintColor = UIColor.white // Geri düğmesinin rengini beyaz yapın
            self.navigationItem.backBarButtonItem = backButton
      

    }
    

    
  
    @IBAction func ProfilimButton(_ sender: Any) {
        performSegue(withIdentifier: "Hesap", sender: nil)
    }
    @IBAction func BildirimlerButton(_ sender: Any) {
        performSegue(withIdentifier: "Bildirimler", sender: nil)
    }

}
