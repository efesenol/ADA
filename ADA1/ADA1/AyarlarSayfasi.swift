//
//  AyarlarSayfası.swift
//  ADA Project
//
//  Created by Efe Şenol on 25.02.2024.
//

import UIKit

class AyarlarSayfasi: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        // Geri düğmesini özelleştirme
            let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            backButton.tintColor = UIColor.white // Geri düğmesinin rengini beyaz yapın
            self.navigationItem.backBarButtonItem = backButton
        segmentControl.addTarget(self, action: #selector(modeChanged), for: .valueChanged)

    }
    @objc func modeChanged() {
            switch segmentControl.selectedSegmentIndex {
            case 0:
                // Aydınlık moda geç
                overrideUserInterfaceStyle = .light
            case 1:
                // Koyu moda geç
                overrideUserInterfaceStyle = .dark
            default:
                break
            }
        }

    
  
    @IBAction func ProfilimButton(_ sender: Any) {
        performSegue(withIdentifier: "Hesap", sender: nil)
    }
    @IBAction func BildirimlerButton(_ sender: Any) {
        performSegue(withIdentifier: "Bildirimler", sender: nil)
    }

}
