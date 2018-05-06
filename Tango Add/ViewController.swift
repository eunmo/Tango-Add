//
//  ViewController.swift
//  Tango Add
//
//  Created by Eunmo Yang on 5/7/18.
//  Copyright © 2018 Eunmo Yang. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "http://1.235.106.140:3010/#/add/J")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }

    override func prefersHomeIndicatorAutoHidden() -> Bool {
        return true
    }
}

