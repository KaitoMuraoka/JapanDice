//
//  WebViewController.swift
//  JapanDice
//
//  Created by 村岡海人 on 2022/01/05.
//

import UIKit
import WebKit
import Accounts

class WebViewController: UIViewController {
    
    //MainViewControllerから値を受け取る
    var reciever: String = ""
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        bottomView.frame.size = CGSize(width: view.frame.size.width, height: view.frame.size.height - 20)
        
        let url = URL(string: reciever)!
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        webView.goBack()
    }
    
    @IBAction func goButtonTapped(_ sender: Any) {
        webView.goForward()
    }
    
    
    @IBAction func reloadButtonTapped(_ sender: Any) {
        webView.reload()
    }
    
    @IBAction func shareButtonTapped(_ sender: Any) {
        let shareWebSite = NSURL(string: reciever)
        let activityItems = [shareWebSite]
        
        let activityVC = UIActivityViewController(activityItems: activityItems as [Any], applicationActivities: nil)

        self.present(activityVC, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func safariButtonTapped(_ sender: Any) {
        if UIApplication.shared.canOpenURL(webView.url!){
            UIApplication.shared.open(webView.url!)
        }else{
            print("ブラウザ起動失敗")
        }
    }
    
}
