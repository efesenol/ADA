//
//  ViewController.swift
//  ADA Project
//
//  Created by Efe Şenol on 25.02.2024.
//

import UIKit

class GirisSayfasi: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var TelefonNumarası: UITextField!
    @IBOutlet weak var sifre: UITextField!
    var isSeguePerfprmed = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Geri düğmesini özelleştirme
            let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            backButton.tintColor = UIColor.systemPink // Geri düğmesinin rengi
            self.navigationItem.backBarButtonItem = backButton
        view.backgroundColor = UIColor.white
        
        

    }
    
    @IBAction func GirisYapButton(_ sender: Any) {
        
        if TelefonNumarası.text == "05523027671" && sifre.text == "123" {
            alert2(titleGiris: "Hoşgeldin Efe", MassageGiris: "Başarıyla Giriş Yapıldı")
        }else if TelefonNumarası.text == "" && sifre.text == "" {
            alert(titleGirdisi: "Giriş Yapılmadı", MassageGirdisi: "Bilgileriniz Eksiksiz Girin")
        }else if TelefonNumarası.text != "0552 302 76 71" || sifre.text != "123" {
            alert(titleGirdisi: "Giriş Yapılamadı", MassageGirdisi: "Telefon numarası veya şifreniz yalnış")
        }else {
            alert(titleGirdisi: "Hata", MassageGirdisi: "Beklenmeyen bir hata oluştu")
        }
    }
    
    @IBAction func kayıtOlButton(_ sender: Any) {
        
    }
    
    
    func alert (titleGirdisi : String, MassageGirdisi : String){ //İlk alert (Giris Yapılamadığı zaman çıkar )
        let uyarıMesajı = UIAlertController(title: titleGirdisi, message: MassageGirdisi, preferredStyle: UIAlertController.Style.alert)
        let tamamButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default){
            (UIAlertAction) in

        }
        uyarıMesajı.addAction(tamamButton)
        self.present(uyarıMesajı,animated: true,completion: nil)
    }

    func alert2 (titleGiris : String, MassageGiris : String){ //2.Alert (giriş yap butonuna bastığında tamam butonuna basınca giriş yapar
        let uyarı = UIAlertController(title: titleGiris, message: MassageGiris, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default) { (UIAlertAction) in
            self.performSegue(withIdentifier: "AnaSayfa", sender: nil)

        }
        uyarı.addAction(okButton)
        self.present(uyarı,animated: true,completion: nil)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
