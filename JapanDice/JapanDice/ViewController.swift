//
//  ViewController.swift
//  JapanDice
//
//  Created by 村岡海人 on 2021/10/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var prefecturesImage: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    
    let diceArray = ["北海道", "青森", "秋田", "宮城", "福島", "山形", "岩手", "千葉", "埼玉", "群馬", "栃木", "茨城", "石川", "富山", "新潟", "神奈川", "東京", "静岡", "岐阜", "長野", "山梨", "福井", "大阪", "京都", "滋賀", "三重", "愛知", "島根", "鳥取", "和歌山", "奈良", "兵庫", "香川", "徳島", "山口", "広島", "岡山", "長崎", "佐賀", "福岡", "高知", "愛媛", "沖縄", "鹿児島", "宮崎", "大分", "熊本"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func throwDiceButton(_ sender: Any) {
        
        let imageName = diceArray.randomElement()!
        prefecturesImage.image = UIImage(named: imageName)
        nameLabel.text = imageName
        print(diceArray.count)
    }
    
    @IBAction func tapImage(_ sender: Any) {
        
        let itemName = nameLabel.text!
        let itemEncodeString = itemName.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)
        let urlString = "https://www.google.com/search?q=\(itemEncodeString!)%E3%80%80%E8%A6%B3%E5%85%89&sxsrf=AOaemvLpFFO50VjwGcKwh1SsKHpi3lqFYg%3A1634163806388&ei=XlxnYbSbF8avoASMoYGIAQ&ved=0ahUKEwi0wrzJtsjzAhXGF4gKHYxQABEQ4dUDCA4&uact=5&oq=\(itemEncodeString!)%E3%80%80%E8%A6%B3%E5%85%89&gs_lcp=Cgdnd3Mtd2l6EAMyCAgAELEDEIMBMgkIABCABBAEECUyBAgAEEMyCQgAEIAEEAQQJTIJCAAQgAQQBBAlMgQIABBDMgQIABBDMgkIABCABBAEECU6BwgAEEcQsAM6BQgAELEDOgcIABCABBAESgQIQRgAUOIIWOIXYJEeaAFwAngAgAHIAogB8AySAQcwLjYuMS4xmAEAoAEByAEIwAEB&sclient=gws-wiz"
        //safariを開かせる
        let url = NSURL(string: urlString)
        
        if UIApplication.shared.canOpenURL(url! as URL){
            
            UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
        }
        
    }
    
}

