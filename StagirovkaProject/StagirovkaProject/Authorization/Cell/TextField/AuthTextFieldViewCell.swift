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
        guard let viewModel = self.viewModel as? BaseCellViewModel else {
            return
        }
        
        //contentView.autoSetDimension(.height, toSize: viewModel.heightCell!)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        textField.layer.cornerRadius = textField.bounds.height / 2
        textField.layer.borderWidth = 1.0
        textField.delegate = self
        print(viewModel.debugDescription)
        if AuthViewController.number == 1 {
            textField.isSecureTextEntry = true
        } else {
            textField.isSecureTextEntry = false
        }
        let cellInfo = AuthViewController.textFieldArray[AuthViewController.number]
        AuthViewController.number = (AuthViewController.number + 1) % AuthViewController.textFieldArray.count
        configurationTextField(placeholder: cellInfo.0, imageName: cellInfo.1)
    }

    func configurationTextField(placeholder: String, imageName: String) {
        textField.placeholder = placeholder
        setLeftSideImage(imageName: imageName)
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
        
        if let newText = viewModel.newText {
            newText(text)
        }
        
        print(text)
        
        return true
    }
    
}
