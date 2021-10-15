//
//  WalkThrough.swift
//  JapanDice
//
//  Created by 村岡海人 on 2021/10/15.
//

import Foundation
import UIKit
import EAIntroView

class EAIntro: EAIntroDelegate{
    
    func walkThrough(){
        
        let page1 = EAIntroPage()
        page1.title = "ダイスの振り方"
        page1.desc = "「ダイスを振る」ボタンを押すと47都道府県がランダムで表示されます"
        page1.bgImage = UIImage(named: "bg1")
        page1.titleFont = UIFont(name: "Helvetica-Bold", size: 32)
        page1.descPositionY = self.view.bounds.size.height/2
        let page2 = EAIntroPage()
        page2.title = "画面をタップ"
        page2.desc = "都道府県をタップすると、その都道府県の観光について検索します"
        page2.bgImage = UIImage(named: "bg2")
        let introView = EAIntroView(frame: self.view.bounds, andPages: [page1, page2])
        introView?.skipButton.setTitle("スキップ", for: UIControl.State.normal)
        introView?.delegate = self
        introView?.show(in: self.view, animateDuration: 1.0)
    }
}
