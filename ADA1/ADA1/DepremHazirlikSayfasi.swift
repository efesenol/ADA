//
//  DepremHazırlıkSayfası.swift
//  ADA Project
//
//  Created by Efe Şenol on 25.02.2024.
//

import UIKit

class DepremHazirlikSayfasi: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    let sections = ["Deprem Öncesi Hazırlık", "Deprem Anında Hazırlık", "Deprem Sonrası Hazırlık"]
    let depremÖncesi = ["Ailenizle birlikte deprem anında ne yapmanız gerektiğine dair bir plan oluşturun.","Acil durum kaçış planları belirleyin ve bunları evinizin her odasında bulunan pencerelere ve kapılara asın.","Bir acil çanta hazırlayın ve içine birkaç gün yetecek kadar temel malzemeler, su, ilaçlar ve kişisel belgeler gibi önemli eşyaları koyun.","Acil durum çantanızı kolayca ulaşabileceğiniz bir yerde tutun.","Ev ve bina güvenliği açısından önemli olan noktalara dikkat edin. Evinizin dayanıklılığını artırmak için gereken önlemleri alın.","Riske giren mobilya, cihaz ve eşyaları sabitleyin veya güvenli bir şekilde depolayın.","Acil durumda ihtiyaç duyacağınız temel malzemeleri (su, gıda, ilaçlar, piller, vb.) stoklayın ve düzenli olarak tazeliklerini kontrol edin.","Kullanım tarihi geçmiş ürünleri atın ve yenileyin.","Ailenizle, komşularınızla ve diğer yakınlarınızla iletişim kurabileceğiniz bir plan belirleyin.","Acil durumlarda nasıl haberleşeceğinizi ve nerede buluşacağınızı planlayın.","Temel ilk yardım bilgisi edinin ve acil durumlarda nasıl müdahale edeceğinizi öğrenin.","Birinci yardım kitinizi eksiksiz ve ulaşılabilir bir yerde tutun.","Ev, eşya ve kişisel mal varlığınızı kapsayan bir sigorta poliçeniz olduğundan emin olun.","Poliçenizin deprem ve doğal afetler gibi olayları içerip içermediğini kontrol edin.","Yangın söndürücülerinizi düzenli olarak kontrol edin ve çalışır durumda olduklarından emin olun.","Yangın merdivenleri ve acil çıkış yollarını gözden geçirin.","Ailenizle birlikte, deprem sonrasında nerede buluşacağınızı ve nasıl haberleşeceğinizi belirleyin.","Çocuklar ve yaşlılar için özel ihtiyaçlarını göz önünde bulundurun ve onlar için özel bir plan yapın.","Acil durumlarda onların güvenliğini sağlayacak önlemleri alın.","Komşularınızla iyi ilişkiler kurun ve birbirinize destek olabileceğiniz bir ağ oluşturun.","Deprem çantanızdaki malzemeleri düzenli olarak kontrol edin ve yenileyin.","Acil durumlarda kullanabileceğiniz ekipmanları tamir edin veya yenileyin."]
    let depremAnında = ["Deprem sırasında kendinizi hemen koruyacak bir yer bulun. Bu, masanın altına, bir iç duvarın yanına veya taşıyıcı bir mobilyanın altına saklanmak olabilir. Başınızı ve boyununuzu korumak için ellerinizle başınızı ve ensenizi kapatın.","Deprem sırasında, eğer mümkünse, hareket etmeyin ve sakin kalın. Hızla yer değiştirmek sizi daha fazla riske sokabilir.","Deprem anında asansör kullanmayın. Eğer asansördeyseniz, en yakın katın düşme ihtimali yüksek olduğunu unutmayın. Mümkünse, en yakın katta kapıyı açın ve emniyetli bir şekilde dışarı çıkın.","İçerideyseniz ve güvenli bir yerde değilseniz, mümkünse açık bir alana çıkın. Yüksek binaların yakınında veya elektrik tellerinin altında durmayın.","Deprem sırasında dengenizi kaybetmeye çalışın. Eğer düşme riski altındaysanız, eğilin, dizlerinizi kıvırın ve ellerinizle başınızı koruyun.","Araç kullanıyorsanız, hemen durun ve trafikten uzak bir yere park edin. Açık alanda inin ve elektrik telleri, binalar ve ağaçlardan uzak durun.","Deprem sonrası yangın riskine karşı dikkatli olun. Gaz kokusu alırsanız hemen dışarı çıkın ve yetkilileri arayın. Ayrıca, su sızıntılarına karşı da dikkatli olun ve elektrik kontağı riskine karşı ıslak bölgelerden uzak durun.","Deprem anında sakin kalın ve panik yapmayın. Diğer insanlara yardımcı olmaya çalışın ve yakınlarınızı güvende tutun.","Deprem sonrasında yerel yetkililerin talimatlarını dinleyin. Radyo veya televizyon gibi haber kaynaklarından güncel bilgileri takip edin.","Yıkıntıların altında kalmış insanlara yaklaşmayın ve onları kendi başınıza kurtarmaya çalışmayın. Yaralıları yetkililere veya kurtarma ekiplerine bildirin."]
    let depremSonrasi = ["Deprem sırasında yaralandıysanız veya birisi yaralandıysa, hemen sağlık yardımı için yetkililere veya kurtarma ekiplerine bildirin.","Tehlike altındaysanız hemen güvenli bir yere taşıyın ve kendinizi koruyun.","Deprem sonrası yangın riskine karşı dikkatli olun. Yangın varsa, hemen yetkililere veya itfaiyeye haber verin.","Gaz kokusu alırsanız, hemen dışarı çıkın ve gaz vanasını kapatın. Sızıntı varsa, yetkililere veya gaz şirketine haber verin.","Su sızıntılarına dikkat edin ve suyun elektrik kontağına neden olabileceği ıslak bölgelerden uzak durun.","Ev veya bina hasarı varsa, tehlikeli alanlardan uzak durun ve yetkililere bildirin.","Elektrik, gaz ve su hatlarındaki hasarları kontrol edin. Hasarlı hatları kapatın veya yetkililere bildirin.","Çatı veya duvarlardaki çatlakları, sıvı sızıntılarını ve diğer yapısal hasarları değerlendirin.","Deprem sonrası yerel yetkililerin ve kurtarma ekiplerinin talimatlarını dinleyin ve takip edin.","Radyo, televizyon veya diğer haber kaynaklarından güncel bilgileri ve talimatları alın.","Acil durum hattını arayarak yardım isteyin veya ihtiyaçlarınızı yetkililere bildirin.","Yaralıları ve acil tıbbi yardım gerektiren kişileri hemen yetkililere bildirin.","Yakınlarınız ve komşularınız gibi yardıma ihtiyacı olanları destekleyin. Birlikte hareket ederek ve dayanışma göstererek toplumsal dayanışmayı güçlendirin","Deprem sonrası yaşadığınız deneyimleri göz önünde bulundurarak acil durum hazırlıklarınızı gözden geçirin ve güncelleyin.","Acil durum çantanızdaki malzemeleri kontrol edin ve yenileyin.","Deprem sonrası stresli bir dönem yaşayabilirsiniz. Kendinize ve sevdiklerinize destek olun, duygularınızı ifade edin ve profesyonel destek almak için gerektiğinde yardım isteyin."]
    
    
    
    var currentSections : [String] = []
    
    @IBOutlet weak var HazırlıkTableVİew: UITableView!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Geri düğmesini özelleştirme
            let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            backButton.tintColor = UIColor.white // Geri düğmesinin rengini beyaz yapın
            self.navigationItem.backBarButtonItem = backButton
        
        HazırlıkTableVİew.dataSource = self
        HazırlıkTableVİew.delegate = self
        view.backgroundColor = UIColor.white
        

    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return depremÖncesi.count
        }else if section == 1 {
            return depremAnında.count
        }else {
            return depremSonrasi.count
        }
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = HazırlıkTableVİew.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if indexPath.section == 0 {
            currentSections = depremÖncesi
        }else if indexPath.section == 1 {
            currentSections = depremAnında
        }else {
            currentSections = depremSonrasi
        }
        cell.textLabel?.text = currentSections[indexPath.row]
        cell.textLabel?.numberOfLines = 0 // Metnin birden fazla satırda gösterilmesini sağlar
        cell.textLabel?.lineBreakMode = .byWordWrapping // Metnin satır sonlarında kesilmesini sağlar
        cell.textLabel?.textColor = UIColor.black // Metin rengi siyah
        cell.backgroundColor = UIColor.white //Tableview arka plan beyaz
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // İstenen hücre yüksekliğini döndürün (örneğin, 60 gibi)
        return 135
    }

}
