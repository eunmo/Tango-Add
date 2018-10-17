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
    let url = URL(string: "http://52.195.14.242:3020/#/add/J")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        
        webView.scrollView.bounces = true
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(ViewController.refreshWebView(sender:)), for: UIControlEvents.valueChanged)
        webView.scrollView.addSubview(refreshControl)
    }

    override func prefersHomeIndicatorAutoHidden() -> Bool {
        return true
    }
    
    @objc func refreshWebView(sender: UIRefreshControl) {
        webView.load(URLRequest(url: url))
        sender.endRefreshing()
    }
}

