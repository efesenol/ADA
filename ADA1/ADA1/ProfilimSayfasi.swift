//
//  ProfilimSayfası.swift
//  ADA Project
//
//  Created by Efe Şenol on 25.02.2024.
//

import UIKit

class ProfilimSayfasi: UIViewController {

    @IBOutlet weak var AdSoyadLabel: UILabel!
    @IBOutlet weak var CinsiyetLabel: UILabel!
    @IBOutlet weak var YaşLabel: UILabel!
    @IBOutlet weak var TelefonNOLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        // Geri düğmesini özelleştirme
            let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            backButton.tintColor = UIColor.white // Geri düğmesinin rengini beyaz yapın
            self.navigationItem.backBarButtonItem = backButton

    }
    
    @IBAction func BildirimlerAçKapa(_ sender: Any) {
    }
    
   

}