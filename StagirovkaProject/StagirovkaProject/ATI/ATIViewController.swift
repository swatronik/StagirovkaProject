//
//  ATIViewController.swift
//  StagirovkaProject
//
//  Created by Admin on 13/12/2018.
//  Copyright © 2018 PolyakovDenis. All rights reserved.
//

import UIKit

class ATIViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    
    let URLString = "https://public-api.wordpress.com/oauth2/authorize?state=0&scope=global&redirect_uri=http://internshipForSimbirSoft.com/&response_type=token&client_id=64116"
    let service = "SecurityService"
    let account = "TokenAccess"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = NSURL(string: URLString) else { return }
        
        webView.delegate = self
        webView.loadRequest(NSURLRequest(url: url as URL) as URLRequest)
    }
    
    public func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        let parsingURL = request.url?.absoluteString.split(separator: "#")
        if parsingURL?[0] == "http://internshipforsimbirsoft.com/" {
            guard let tokenAccess = request.url?.absoluteString.split(separator: "&")[0].split(separator: "=")[1] else { return false }
            KeychainService.savePassword(service: service, account: account, data: String(tokenAccess))
            if let tokenKeychain = KeychainService.loadPassword(service: service, account: account) {
                print(tokenKeychain)
            }
            else { print("Token Access does not exist")}

            
        }
        return true
    }
    
}
