//
//  InfoViewController.swift
//  JapanDice
//
//  Created by 村岡海人 on 2022/01/14.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var PrivacyPoliceyLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        PrivacyPoliceyLabel.titleLabel?.numberOfLines = 1
        PrivacyPoliceyLabel.titleLabel?.adjustsFontSizeToFitWidth = true

    }
    
    
    @IBAction func SuportButton(_ sender: Any) {
        print("This is SuportButton")
    }
    
    @IBAction func LicenseButton(_ sender: Any) {
        print("This is LicenseButton")
    }
    
    @IBAction func PrivacyPolicyButton(_ sender: Any) {
        print("This is PrivacyPolicyButton")
    }
    
}
