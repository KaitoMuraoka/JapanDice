//
//  ViewController.swift
//  JapanDice
//
//  Created by 村岡海人 on 2021/10/15.
//

import UIKit
import EAIntroView
import SideMenu


class MainViewController: UIViewController, EAIntroDelegate {
    
    var menu: SideMenuNavigationController?
    //MARK: -メイン
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var prefecturesImage: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    let diceArray = ["北海道", "青森", "秋田", "宮城", "福島", "山形", "岩手", "千葉", "埼玉", "群馬", "栃木", "茨城", "石川", "富山", "新潟", "神奈川", "東京", "静岡", "岐阜", "長野", "山梨", "福井", "大阪", "京都", "滋賀", "三重", "愛知", "島根", "鳥取", "和歌山", "奈良", "兵庫", "香川", "徳島", "山口", "広島", "岡山", "長崎", "佐賀", "福岡", "高知", "愛媛", "沖縄", "鹿児島", "宮崎", "大分", "熊本"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menu = SideMenuNavigationController(rootViewController: MenuListController())
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: false)
        
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
    }
    
    @IBAction func didTapMenu(){
        present(menu!, animated: true)
    }

//    MARK: -EAIntro
//    func walkThrough(){
//
//        let page1 = EAIntroPage()
//        page1.title = "ダイスの振り方"
//        page1.desc = "「ダイスを振る」ボタンを押すと47都道府県がランダムで表示されます"
//        page1.bgImage = UIImage(named: "bg1")
//        page1.titleFont = UIFont(name: "Helvetica-Bold", size: 32)
//        page1.descFont = UIFont(name: "Helvetica-Regular", size: 25)
//        page1.descPositionY = self.view.bounds.size.height/2
//        let page2 = EAIntroPage()
//        page2.title = "画面をタップ"
//        page2.desc = "都道府県をタップすると、その都道府県の観光について検索します"
//        page2.bgImage = UIImage(named: "bg2")
//        page2.titleFont = UIFont(name: "Helvetica-Bold", size: 32)
//        page2.descFont = UIFont(name: "Helvetica-Regular", size: 25)
//        page2.descPositionY = self.view.bounds.size.height/2
//        let introView = EAIntroView(frame: self.view.bounds, andPages: [page1, page2])
//        introView?.skipButton.setTitle("スキップ", for: UIControl.State.normal)
//        introView?.delegate = self
//        introView?.show(in: self.view, animateDuration: 1.0)
//    }
    
    //MARK: -ダイスボタン
    @IBAction func throwDiceButton(_ sender: Any) {
        
        
        let imageName = diceArray.randomElement()!
        prefecturesImage.image = UIImage(named: imageName)
        nameLabel.text = imageName
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
    @IBAction func info(_ sender: Any) {
        
//        walkThrough()
    }
    
    func alertFunc(_ itemName: String){
        let alert = UIAlertController(title: "\(itemName)の観光について検索します", message: "よろしいですか？", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default) { (action: UIAlertAction!) in
            
            let itemEncodeString = itemName.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)
            let urlString = "https://www.google.com/search?q=\(itemEncodeString!)%E3%80%80%E8%A6%B3%E5%85%89&sxsrf=AOaemvLpFFO50VjwGcKwh1SsKHpi3lqFYg%3A1634163806388&ei=XlxnYbSbF8avoASMoYGIAQ&ved=0ahUKEwi0wrzJtsjzAhXGF4gKHYxQABEQ4dUDCA4&uact=5&oq=\(itemEncodeString!)%E3%80%80%E8%A6%B3%E5%85%89&gs_lcp=Cgdnd3Mtd2l6EAMyCAgAELEDEIMBMgkIABCABBAEECUyBAgAEEMyCQgAEIAEEAQQJTIJCAAQgAQQBBAlMgQIABBDMgQIABBDMgkIABCABBAEECU6BwgAEEcQsAM6BQgAELEDOgcIABCABBAESgQIQRgAUOIIWOIXYJEeaAFwAngAgAHIAogB8AySAQcwLjYuMS4xmAEAoAEByAEIwAEB&sclient=gws-wiz"
            //safariを開かせる
            let url = NSURL(string: urlString)
            
            if UIApplication.shared.canOpenURL(url! as URL){
                UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
            }
        }
        
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel) { (action: UIAlertAction) in
            print("Cancel")
        }
        
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        
        present(alert, animated: true, completion: nil)
    }
    
}

//MARK: -SideMenu
class MenuListController: UITableViewController{
    let darkColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
    
    var items = ["First", "Second", "Third"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = darkColor
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = darkColor
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //do something
    }
    
    
}
