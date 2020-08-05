//
//  ViewController.swift
//  Tango Add
//
//  Created by Eunmo Yang on 5/7/18.
//  Copyright © 2018 Eunmo Yang. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {

    var webView: WKWebView!
    let url = URL(string: "http://tango.eunmo.be/add")!
    
    override func loadView() {
        webView = WKWebView(frame: .zero)
        webView.uiDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        view = webView
        
        webView.scrollView.bounces = true
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(ViewController.refreshWebView(sender:)), for: UIControl.Event.valueChanged)
        webView.scrollView.addSubview(refreshControl)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        webView.load(URLRequest(url: url))
    }

    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @objc func refreshWebView(sender: UIRefreshControl) {
        webView.load(URLRequest(url: url))
        sender.endRefreshing()
    }
}

