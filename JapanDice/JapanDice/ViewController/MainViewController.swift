//
//  ViewController.swift
//  JapanDice
//
//  Created by 村岡海人 on 2021/10/15.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController {
    var audioPlayer: AVAudioPlayer!
    
    //MARK: -メイン
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var prefecturesImage: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    let diceArray = ["北海道", "青森", "秋田", "宮城", "福島", "山形", "岩手", "千葉", "埼玉", "群馬", "栃木", "茨城", "石川", "富山", "新潟", "神奈川", "東京", "静岡", "岐阜", "長野", "山梨", "福井", "大阪", "京都", "滋賀", "三重", "愛知", "島根", "鳥取", "和歌山", "奈良", "兵庫", "香川", "徳島", "山口", "広島", "岡山", "長崎", "佐賀", "福岡", "高知", "愛媛", "沖縄", "鹿児島", "宮崎", "大分", "熊本"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //MARK: -ダイスボタン
    @IBAction func throwDiceButton(_ sender: Any) {
        //音が流れる
        playSound(name: "pushSound")
        
        //アニメーション
        prefecturesImage.animationImages = animatedImages()
        prefecturesImage.animationDuration = 0.5
        prefecturesImage.animationRepeatCount = 2
        prefecturesImage.image = prefecturesImage.animationImages?.first
        
        prefecturesImage.startAnimating()
        let imageName = diceArray.randomElement()
        prefecturesImage.image = UIImage(named: imageName!)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9){
            self.nameLabel.text = imageName
        }
    }
    
    @IBAction func tapImage(_ sender: Any) {
        let itemName = nameLabel.text!
        
        if itemName == "都道府県ダイス" {
            return
        }else{
            alertFunc(itemName)
        }

    }
    
    //MARK: -infomation
    func alertFunc(_ itemName: String){
        let alert = UIAlertController(title: "\(itemName)の観光について検索します", message: "よろしいですか？", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default) { (action: UIAlertAction!) in
            
            let itemEncodeString = itemName.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)
            let urlString = "https://www.google.com/search?q=\(itemEncodeString!)%E3%80%80%E8%A6%B3%E5%85%89&sxsrf=AOaemvLpFFO50VjwGcKwh1SsKHpi3lqFYg%3A1634163806388&ei=XlxnYbSbF8avoASMoYGIAQ&ved=0ahUKEwi0wrzJtsjzAhXGF4gKHYxQABEQ4dUDCA4&uact=5&oq=\(itemEncodeString!)%E3%80%80%E8%A6%B3%E5%85%89&gs_lcp=Cgdnd3Mtd2l6EAMyCAgAELEDEIMBMgkIABCABBAEECUyBAgAEEMyCQgAEIAEEAQQJTIJCAAQgAQQBBAlMgQIABBDMgQIABBDMgkIABCABBAEECU6BwgAEEcQsAM6BQgAELEDOgcIABCABBAESgQIQRgAUOIIWOIXYJEeaAFwAngAgAHIAogB8AySAQcwLjYuMS4xmAEAoAEByAEIwAEB&sclient=gws-wiz"
            
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "secondViewController") as! WebViewController
            nextVC.reciever = urlString
            self.present(nextVC, animated: true, completion: nil)
            //safariを開かせる
//            let url = NSURL(string: urlString)
//            if UIApplication.shared.canOpenURL(url! as URL){
//                UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
        }
    
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel) { (action: UIAlertAction) in
            print("Cancel")
        }
        
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        
        present(alert, animated: true, completion: nil)
    }
        
    //MARK: -アニメーション
    func animatedImages() -> [UIImage]{
        var images = [UIImage]()
        
        for name in diceArray {
            let image = UIImage(named: name)
            images.append(image!)
        }
        return images
    }
    
    
}

extension MainViewController: AVAudioPlayerDelegate{
    
    func playSound(name: String){
        guard let soundURL = Bundle.main.url(forResource: "pushSound", withExtension: "mp3") else {
            print("Not Found")
            return
        }
        
        audioPlayer = try! AVAudioPlayer(contentsOf: soundURL)
        audioPlayer.delegate = self
        audioPlayer.play()
        audioPlayer.volume = 2.0
        print("流れます")
    }
}
