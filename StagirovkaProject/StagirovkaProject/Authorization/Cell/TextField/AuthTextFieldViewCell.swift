//
//  AuthTextFieldViewCell.swift
//  StagirovkaProject
//
//  Created by Admin on 21/11/2018.
//  Copyright © 2018 PolyakovDenis. All rights reserved.
//

import UIKit

class AuthTextFieldViewCell: BaseTableViewCell {

    @IBOutlet weak var textField: UITextField!
    
    override func viewModelChanged() {
        super.viewModelChanged()
        guard let viewModel = self.viewModel as? AuthTextFieldViewModel else {
            return
        }
        textField.isSecureTextEntry = viewModel.isSecure
        textField.placeholder = viewModel.placeholderText
        setLeftSideImage(imageName: viewModel.iconName)
        //contentView.autoSetDimension(.height, toSize: viewModel.heightCell!)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setBorder()
        textField.delegate = self
    }

    private func setBorder() {
        textField.layer.cornerRadius = textField.bounds.height / 2
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    private func setLeftSideImage(imageName: String){
        
        let leftImageView = UIImageView()
        leftImageView.contentMode = .scaleAspectFit
        
        let leftView = UIView()
        
        leftView.frame = CGRect(x: 26, y: 0, width: 30, height: 20)
        leftImageView.frame = CGRect(x: 13, y: 0, width: 12, height: 16)
        textField.leftViewMode = .always
        textField.leftView = leftView
        
        let image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
        leftImageView.image = image
        leftImageView.tintColor = UIColor.lightGray
        leftImageView.tintColorDidChange()
        
        leftView.addSubview(leftImageView)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension AuthTextFieldViewCell: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
  
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        //        let _ = self.textfield.textFieldShouldEndEditing(textField)
        //
        //        textField.placeholder = placeholderText
        //
        //        if let handler = textFieldEndEditing {
        //            handler()
        //        }
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var text = "\(textField.text ?? "")\(string)"
        
        if string.isEmpty {
            guard let _ = text.popLast() else {
                return false
            }
        }
        
        guard let viewModel = self.viewModel as? AuthTextFieldViewModel else {
            return false
        }
        
        if let newTextClosure = viewModel.newTextClosure {
            newTextClosure(text)
        }
        
        return true
    }
    
}
