//
//  MenuViewController.swift
//  HotchStudentHiFi
//
//  Created by Roger P Wistar on 5/30/20.
//  Copyright © 2020 Roger P Wistar. All rights reserved.
//

import UIKit
import WebKit

class MenuViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var menuWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        menuWebView.navigationDelegate = self
        
        if let address = URL(string: "https://www.hotchkiss.org/todays-menu") {
            let request = URLRequest(url: address)
            menuWebView.load(request)
        } else {
            print("Can't load menu!")
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
