//
//  WikiViewController.swift
//  Netflicks
//
//  Created by Matthew Barth on 7/29/15.
//  Copyright (c) 2015 Matthew Barth. All rights reserved.
//

import UIKit

class WikiViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var url: NSURL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var request = NSURLRequest(URL: url!)
        
        webView.loadRequest(request)
    }
    

}
