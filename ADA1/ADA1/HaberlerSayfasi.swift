//
//  HaberSayfası.swift
//  ADA Project
//
//  Created by Efe Şenol on 25.02.2024.
//

import UIKit

class HaberlerSayfasi: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        // Geri düğmesini özelleştirme
            let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            backButton.tintColor = UIColor.white // Geri düğmesinin rengini beyaz yap
            self.navigationItem.backBarButtonItem = backButton
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = "Haber"
        cell.contentConfiguration = content
        cell.textLabel?.textColor = UIColor.black // Metin rengi siyah
        cell.backgroundColor = UIColor.white //Tableview arka plan beyaz
        return cell
    }
    

}
