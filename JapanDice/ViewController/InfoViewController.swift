//
//  InfoViewController.swift
//  JapanDice
//
//  Created by 村岡海人 on 2022/01/14.
//

import UIKit

class InfoViewController: UIViewController {

    
    @IBOutlet weak var SupportButtonLabel: UIButton!
    @IBOutlet weak var PrivacyPoliceyLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        SupportButtonLayout()
        PrivacyPoliceyButtonLayout()

    }
    
    
    @IBAction func SuportButton(_ sender: Any) {
        print("This is SuportButton")
        
        let url = URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSeVKCO0E6XMa2XiNasz0tHELgsFiy1XMRRcWgT-KUNwS0hM8w/viewform?usp=sf_link")
        if UIApplication.shared.canOpenURL(url!) {
            UIApplication.shared.open(url!)
        }else{
            print("ブラウザ立ち上げ失敗")
        }
    }
    
    @IBAction func PrivacyPolicyButton(_ sender: Any) {
        print("This is PrivacyPolicyButton")
        
        let url = URL(string: "https://kaitomuraoka.github.io/JapanDice/")
        if UIApplication.shared.canOpenURL(url!) {
            UIApplication.shared.open(url!)
        }else{
            print("ブラウザ立ち上げ失敗")
        }
    }
    
    private func SupportButtonLayout(){
        SupportButtonLabel.frame = CGRect(x: (self.view.bounds.width-160)/2, y: view.frame.height / 2.5, width: 156, height: 84)
    }
    
    private func PrivacyPoliceyButtonLayout(){
        PrivacyPoliceyLabel.titleLabel?.numberOfLines = 1
        PrivacyPoliceyLabel.titleLabel?.adjustsFontSizeToFitWidth = true
        
        PrivacyPoliceyLabel.frame = CGRect(x: (self.view.bounds.width-160)/2, y: view.frame.size.height / 1.5, width: 156, height: 84)
    }
}
