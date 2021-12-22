//
//  ContainerViewController.swift
//  JapanDice
//
//  Created by 村岡海人 on 2021/12/21.
//

import UIKit

class ContainerViewController: UIViewController {
    
    let menuVC = MenuViewController()
    let mainVC = MainViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "HContainer"
        addChildVCs()
    }

}

