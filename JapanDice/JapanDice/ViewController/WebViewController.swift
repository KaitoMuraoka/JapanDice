//
//  WebViewController.swift
//  JapanDice
//
//  Created by 村岡海人 on 2022/01/05.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    //MainViewControllerから値を受け取る
    var reciever = ""
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        webView.navigationDelegate = self
        let url = URL(string: reciever)!
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
}
