//
//  EnkazİhbarSayfası.swift
//  ADA Project
//
//  Created by Efe Şenol on 25.02.2024.
//

import UIKit
import AVFoundation


class EnkazIhbarSayfasi: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Geri düğmesini özelleştirme
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        backButton.tintColor = UIColor.white // Geri düğmesinin rengini beyaz yapın
        self.navigationItem.backBarButtonItem = backButton
        view.backgroundColor = UIColor.white


        
        
    }
    
    
    @IBAction func FotografCek(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)

    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Seçilen medyanın türüne göre işlem yap
        if info[UIImagePickerController.InfoKey.originalImage] is UIImage {
            // Seçilen fotoğrafı işleyin veya gösteriyor
            // Örnek olarak, burada seçilen fotoğrafı bir UIImageView'a gösteriyor
            
            // Seçilen fotoğrafı cihaz galerisine kaydet
            if let imageUrl = info[UIImagePickerController.InfoKey.imageURL] as? URL {
                do {
                    let imageData = try Data(contentsOf: imageUrl)
                    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                    let fileURL = documentsDirectory.appendingPathComponent("selectedImage.jpg")
                    try imageData.write(to: fileURL)
                    print("Fotoğraf başarıyla kaydedildi: \(fileURL)")

                } catch {
                    print("Fotoğrafı kaydetme hatası: \(error)")
                }
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    // UIImagePickerControllerDelegate metodu - kullanıcı fotoğraf seçmeyi iptal ettiğinde çağrılır
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func GaleriButton(_ sender: Any) {
        openImagePicker(sourceType : .photoLibrary)
    }
    func openImagePicker(sourceType : UIImagePickerController.SourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = sourceType
        present(imagePicker, animated: true, completion: nil)
    }
    
    
        
    }
    
    
    
    

