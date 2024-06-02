//
//  KayıtOlSayfasi.swift
//  ADA Project
//
//  Created by Efe Şenol on 13.03.2024.
//

import UIKit
import Firebase
class KayitOlSayfasi: UIViewController {

    @IBOutlet weak var ad: UITextField!
    @IBOutlet weak var soyad: UITextField!
    @IBOutlet weak var telefonNumarası: UITextField!
    @IBOutlet weak var sifre: UITextField!
    @IBOutlet weak var sifreTekrar: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Geri düğmesini özelleştirme
            let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            backButton.tintColor = UIColor.white // Geri düğmesinin rengini beyaz yapın
            self.navigationItem.backBarButtonItem = backButton
        view.backgroundColor = UIColor.white


    }
    @IBAction func girisButton(_ sender: Any) {
       
    }
    
}
