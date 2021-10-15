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
    
    
    let diceArray = ["北海道", "青森", "秋田", "岩手"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func throwDiceButton(_ sender: Any) {
        
        let imageName = diceArray.randomElement()!
        prefecturesImage.image = UIImage(named: imageName)
        nameLabel.text = imageName
    }
    
    @IBAction func tapImage(_ sender: Any) {
        
        let itemName = nameLabel.text!
        let itemEncodeString = itemName.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)
        let urlString = "https://www.google.com/search?q=\(itemEncodeString!)%E3%80%80%E8%A6%B3%E5%85%89&sxsrf=AOaemvLpFFO50VjwGcKwh1SsKHpi3lqFYg%3A1634163806388&ei=XlxnYbSbF8avoASMoYGIAQ&ved=0ahUKEwi0wrzJtsjzAhXGF4gKHYxQABEQ4dUDCA4&uact=5&oq=\(itemEncodeString!)%E3%80%80%E8%A6%B3%E5%85%89&gs_lcp=Cgdnd3Mtd2l6EAMyCAgAELEDEIMBMgkIABCABBAEECUyBAgAEEMyCQgAEIAEEAQQJTIJCAAQgAQQBBAlMgQIABBDMgQIABBDMgkIABCABBAEECU6BwgAEEcQsAM6BQgAELEDOgcIABCABBAESgQIQRgAUOIIWOIXYJEeaAFwAngAgAHIAogB8AySAQcwLjYuMS4xmAEAoAEByAEIwAEB&sclient=gws-wiz"
        //サファリを開かせる
        let url = NSURL(string: urlString)
        
        if UIApplication.shared.canOpenURL(url! as URL){
            
            UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
        }
        
    }
    
}

