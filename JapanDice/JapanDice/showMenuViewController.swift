//
//  showMenuViewController.swift
//  JapanDice
//
//  Created by 村岡海人 on 2021/12/10.
//

import UIKit

protocol showMenuViewControllerDelegate{
    func parentViewControllerForSidemenuViewController(_ showMenuViewController: showMenuViewController) -> UIViewController
}

class showMenuViewController: UIViewController {
    
    @IBOutlet weak var menuView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //メニューの位置を取得する
        let menuPos = self.menuView.layer.position
        self.menuView.layer.position.x = -self.menuView.frame.width
        //表示時のアニメーションを作成
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {self.menuView.layer.position.x = menuPos.x}, completion: {bool in})
    }
    
    //メニュー以外のタップ時の処理
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        for touch in touches {
            if touch.view?.tag == 1{
                UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {self.menuView.layer.position.x = -self.menuView.frame.width}, completion: {bool in self.dismiss(animated: true, completion: nil)})
            }
        }
    }
    
    
}
