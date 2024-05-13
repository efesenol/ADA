//
//  Anasayfa.swift
//  ADA Project
//
//  Created by Efe Şenol on 25.02.2024.
//

import UIKit
import AVFoundation

class Anasayfa: UIViewController,AVAudioPlayerDelegate {
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Geri düğmesini özelleştirme
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        backButton.tintColor = UIColor.white // Geri düğmesinin rengini beyaz yapın
        self.navigationItem.backBarButtonItem = backButton
        
        guard let url = Bundle.main.url(forResource: "AcilDurum", withExtension: "mp3") else {
            print("Ses dosyası bulunamadı.")
            return
        }
        do {
            // AVAudioPlayer ile ses dosyasını çal
            player = try AVAudioPlayer(contentsOf: url)
            player?.delegate = self
            player?.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
        view.backgroundColor = UIColor.white

        
    }
    @IBAction func DepremÖncesiButton(_ sender: Any) {
        performSegue(withIdentifier: "DepremOncesi", sender: nil)
    }
    @IBAction func Haritalar(_ sender: Any) {
        performSegue(withIdentifier: "Haritalar", sender: nil)
    }
    @IBAction func EnkazİhbarButton(_ sender: Any) {
        performSegue(withIdentifier: "EnkazIhbar", sender: nil)
    }
    @IBAction func BağışButton(_ sender: Any) {
        performSegue(withIdentifier: "Bagis", sender: nil)
    }
    @IBAction func HaberlerButton(_ sender: Any) {
        performSegue(withIdentifier: "Haberler", sender: nil)
    }
    @IBAction func AlarmButton(_ sender: Any) {
        playSound()
        
        
    }
    @IBAction func AyarlarButton(_ sender: Any) {
        performSegue(withIdentifier: "Ayarlar", sender: nil)
    }
   
    func playSound() {
        player?.play()
        
    }
    
    // AVAudioPlayerDelegate yöntemini uygula
    func audioPlayerDidStartPlaying(_ player: AVAudioPlayer) {
        print("Ses dosyası başarıyla çalınıyor.")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
