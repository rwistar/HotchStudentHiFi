//
//  SocialViewController.swift
//  HotchStudentHiFi
//
//  Created by Roger P Wistar on 5/30/20.
//  Copyright © 2020 Roger P Wistar. All rights reserved.
//

import UIKit
import WebKit

class SocialViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var socialWebView: WKWebView!
    
    var socialURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let url = socialURL, let address = URL(string: url) {
            let request = URLRequest(url: address)
            socialWebView.load(request)
        } else {
            print("Can't load feed!")
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.evaluateJavaScript("document.documentElement.style.webkitUserSelect='none'")
        webView.evaluateJavaScript("document.documentElement.style.webkitTouchCallout='none'")
        webView.evaluateJavaScript("var elems = document.getElementsByTagName('a'); for (var i = 0; i < elems.length; i++) { elems[i]['href'] = 'javascript:(void)'; }")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
