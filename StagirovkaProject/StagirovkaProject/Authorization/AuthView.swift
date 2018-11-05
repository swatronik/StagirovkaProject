//
//  AuthView.swift
//  StagirovkaProject
//
//  Created by Admin on 05/11/2018.
//  Copyright © 2018 PolyakovDenis. All rights reserved.
//

import UIKit

@IBDesignable class AuthView: UIView {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet var contentView: UIView!
    
    @IBInspectable
    var usernameFieldText: String? {
        get {
            return usernameField.text
        }
        set(usernameFieldText) {
            usernameField.text = usernameFieldText
        }
    }
    
    @IBInspectable
    var passwordFieldText: String? {
        get {
            return passwordField.text
        }
        set(passwordField) {
            usernameField.text = passwordField
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        circleCorner(corner: 15)
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("AuthView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    private func circleCorner(corner: CGFloat) {
        logInButton.layer.cornerRadius = corner
        usernameField.layer.cornerRadius = corner
        passwordField.layer.cornerRadius = corner
        contentView.layer.cornerRadius = corner
    }
}
