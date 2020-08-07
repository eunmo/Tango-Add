//
//  ViewController.swift
//  Tango Add
//
//  Created by Eunmo Yang on 5/7/18.
//  Copyright © 2018 Eunmo Yang. All rights reserved.
//

import UIKit
import WebKit

let serverAddress = "http://tango.eunmo.be"

class ViewController: UIViewController, WKUIDelegate {

    var webView: WKWebView!
    let addUrl = URL(string: "\(serverAddress)/add")!
    let searchUrl = URL(string: "\(serverAddress)/search")!
    let summaryUrl = URL(string: "\(serverAddress)/summary")!
    
    override func loadView() {
        let userScript = WKUserScript(source: "window.isWebkit = true;", injectionTime: WKUserScriptInjectionTime.atDocumentStart, forMainFrameOnly: true)
        
        let contentController = WKUserContentController()
        contentController.addUserScript(userScript)
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        
        webView = WKWebView(frame: .zero, configuration: config)
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

        webView.load(URLRequest(url: addUrl))
    }

    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @objc func refreshWebView(sender: UIRefreshControl) {
        webView.load(URLRequest(url: addUrl))
        sender.endRefreshing()
    }
    
    @IBAction func onClickSearch(_ sender: UIBarButtonItem) {
        webView.evaluateJavaScript("window.wkLink('/search');")
    }
    
    @IBAction func onClickAdd(_ sender: UIBarButtonItem) {
        webView.evaluateJavaScript("window.wkLink('/add');")
    }
    
    @IBAction func onClickSummary(_ sender: UIBarButtonItem) {
        webView.evaluateJavaScript("window.wkLink('/summary');")
    }
}

