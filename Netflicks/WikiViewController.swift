//
//  WikiViewController.swift
//  Netflicks
//
//  Created by Matthew Barth on 7/29/15.
//  Copyright (c) 2015 Matthew Barth. All rights reserved.
//

import UIKit
import WebKit

class WikiViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var url: NSURL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var request = NSURLRequest(URL: url!)

        webView.loadRequest(request)
        
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        //Starting:
        activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0,0,100,100))
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        //Ending:
        self.activityIndicator.stopAnimating()

    }
    

}
