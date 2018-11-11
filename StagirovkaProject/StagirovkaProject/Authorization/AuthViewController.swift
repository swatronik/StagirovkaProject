//
//  AuthViewController.swift
//  StagirovkaProject
//
//  Created by Admin on 05/11/2018.
//  Copyright © 2018 PolyakovDenis. All rights reserved.
//

import UIKit

@IBDesignable class AuthViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    //@IBOutlet weak var contentView: AuthView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    let authCellId = "AuthTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        tableView.register(UINib.init(nibName: authCellId, bundle: nil), forCellReuseIdentifier: authCellId)
        tableView.allowsSelection = false
        tableView.layer.cornerRadius = 15
        //scrollView?.keyboardDismissMode = .interactive
        NotificationCenter.default.addObserver(self, selector: #selector(keyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func keyboard(notification: Notification) {
        let userInfo = notification.userInfo!
        
        let keyboardScreenEndFrame: CGRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        if notification.name == UIResponder.keyboardWillHideNotification {
            tableView.contentInset = UIEdgeInsets.zero
        } else {
            tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - (view.bounds.height/2 - 150), right: 0)
        }
    }
    
    func setGradientBackground() {
        let colorTop =  UIColor(red: 50.0/255.0, green: 100.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 150.0/255.0, green: 150.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }

}


extension AuthViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: authCellId, for: indexPath) as! AuthTableViewCell
        return cell
    } 
}
