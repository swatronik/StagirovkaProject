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
    @IBOutlet weak var scrollView: UIScrollView!
    
    let colorTop =  UIColor(red: 50.0/255.0, green: 100.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
    let colorBottom = UIColor(red: 150.0/255.0, green: 150.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
    let authCellId = "AuthTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        tableView.register(UINib.init(nibName: authCellId, bundle: nil), forCellReuseIdentifier: authCellId)
        tableView.allowsSelection = false
        tableView.layer.cornerRadius = 20

        NotificationCenter.default.addObserver(self, selector: #selector(keyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func keyboard(notification: Notification) {
        guard let userInfo = notification.userInfo else {
            return
        }
        guard let keyboardEndUserKey: NSValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        let keyboardScreenEndFrame: CGRect = keyboardEndUserKey.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        if notification.name == UIResponder.keyboardWillHideNotification {
            tableView.contentInset = UIEdgeInsets.zero
        } else {
            tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - (view.bounds.height/2 - 150), right: 0)
        }
    }
    
    private func setGradientBackground() {
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: authCellId, for: indexPath) as? AuthTableViewCell else {
            fatalError("Error convert cell for AuthViewController")
        }
        return cell
    } 
}
