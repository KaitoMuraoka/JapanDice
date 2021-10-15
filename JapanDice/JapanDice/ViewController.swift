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
    
}

