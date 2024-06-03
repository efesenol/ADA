//
//  ViewController.swift
//  ADA Project
//
//  Created by Efe Şenol on 25.02.2024.
//

import UIKit
import AVFoundation
import Firebase

class GirisSayfasi: UIViewController {
    
    var player: AVAudioPlayer?
    var isPlaying = false
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
        // Ses dosyasını yükle
        guard let url = Bundle.main.url(forResource: "AcilDurum", withExtension: "mp3") else {
            print("Ses dosyası bulunamadı.")
            return
        }
        do {
            // AVAudioPlayer ile ses dosyasını çal
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
    }
    @IBAction func GirisYapButton(_ sender: Any) {
        if TelefonNumarası.text != nil && sifre.text != nil {
            Auth.auth().signIn(withEmail: TelefonNumarası.text!, password: sifre.text!) { data, error in
                if error != nil{
                    self.alertCreate(titleInput: "Hata", MessageInput: "Telefon numarası veya şifre boş bırakılamaz")
                }else {
                    self.performSegue(withIdentifier: "TabBar", sender: nil)
                }
            }
        }
    }
    @IBAction func kayıtOlButton(_ sender: Any) {
        
        
    }
    
    func alert (titleGirdisi : String, MassageGirdisi : String){ //İlk alert (Giris Yapılamadığı zaman çıkar )
        let uyarıMesajı = UIAlertController(title: titleGirdisi, message: MassageGirdisi, preferredStyle: UIAlertController.Style.alert)
        let tamamButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default){(UIAlertAction) in}
        uyarıMesajı.addAction(tamamButton)
        self.present(uyarıMesajı,animated: true,completion: nil)
    }
    
    func alert2 (titleGiris : String, MassageGiris : String){ //2.Alert (giriş yap butonuna bastığında tamam butonuna basınca giriş yapar
        let uyarı = UIAlertController(title: titleGiris, message: MassageGiris, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default) { (UIAlertAction) in
            self.performSegue(withIdentifier: "TabBar", sender: nil)
        }
        uyarı.addAction(okButton)
        self.present(uyarı,animated: true,completion: nil)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func AlarmButton(_ sender: Any) {
        if isPlaying {
            player?.pause()
            isPlaying = false
        } else {
            player?.play()
            isPlaying = true
        }
    }
    func alertCreate (titleInput : String, MessageInput : String) {
        let alert = UIAlertController(title: titleInput, message: MessageInput, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert,animated: true)
    }
   
    
}
