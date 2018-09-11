//
//  ViewController.swift
//  ContentFittingWebView
//
//  Created by rpowelll on 09/11/2018.
//  Copyright (c) 2018 rpowelll. All rights reserved.
//

import UIKit
import ContentFittingWebView

class ViewController: UIViewController {

    @IBOutlet var webView: ContentFittingWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let examplePath = Bundle.main.url(forResource: "example", withExtension: "html")!
        let exampleHTML = try! String(contentsOf: examplePath)
        webView.loadHTMLString(exampleHTML, baseURL: nil)
        webView.layer.cornerRadius = 8
        webView.layer.masksToBounds = true
    }

}
