//
//  AuthTableViewCell.swift
//  StagirovkaProject
//
//  Created by Admin on 11/11/2018.
//  Copyright © 2018 PolyakovDenis. All rights reserved.
//

import UIKit

class AuthTableViewCell: UITableViewCell {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    
    let usernameFieldText = "👤 Username"
    let passwordFieldText = "🔒 Password"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        circleCorner(corner: 20)
        // Initialization code
    }
    
    @IBAction func pushLogInButton(_ sender: Any) {
        let login: String! = usernameField.text
        let pass: String! = passwordField.text
        guard (login != usernameFieldText && pass != passwordFieldText) else {
            return
        }
        print (login)
        print (pass)
    }
    
    @IBAction func beginEditingUsernameField(_ sender: Any) {
        usernameField.clearsOnBeginEditing = false
        usernameField.textColor = UIColor.black
    }
    
    @IBAction func beginEditingPasswordField(_ sender: Any) {
        passwordField.isSecureTextEntry = true
        passwordField.clearsOnBeginEditing = false
        passwordField.textColor = UIColor.black
    }
    
    @IBAction func endEditingUsernameField(_ sender: Any) {
        if (usernameField.text == "") {
            usernameField.text = usernameFieldText
            usernameField.clearsOnBeginEditing = true
            usernameField.textColor = UIColor.lightGray
        }
    }
    
    @IBAction func endEditingPasswordField(_ sender: Any) {
        if (passwordField.text == "") {
            passwordField.text = passwordFieldText
            passwordField.isSecureTextEntry = false
            passwordField.clearsOnBeginEditing = true
            passwordField.textColor = UIColor.lightGray
        }
    }
    
    private func circleCorner(corner: CGFloat) {
        logInButton.layer.cornerRadius = corner
        usernameField.layer.cornerRadius = corner
        passwordField.layer.cornerRadius = corner
        usernameField.layer.borderWidth = 1.0
        passwordField.layer.borderWidth = 1.0
        contentView.layer.cornerRadius = corner
    }
    /*override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }*/
    
}
