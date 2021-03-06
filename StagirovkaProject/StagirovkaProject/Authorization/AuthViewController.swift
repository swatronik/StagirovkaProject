//
//  AuthViewController.swift
//  StagirovkaProject
//
//  Created by Admin on 05/11/2018.
//  Copyright © 2018 PolyakovDenis. All rights reserved.
//

import UIKit

@IBDesignable class AuthViewController: UIViewController {
    
    var usernameText = ""
    var passwordText = ""
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    let tableManager = TableDataManager()
    
    let colorTop =  UIColor(red: 65.0/255.0, green: 90.0/255.0, blue: 202.0/255.0, alpha: 1.0).cgColor
    let colorBottom = UIColor(red: 46.0/255.0, green: 150.0/255.0, blue: 205.0/255.0, alpha: 1.0).cgColor
    let authCellId = "AuthTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        tableView.allowsSelection = false
        tableView.layer.cornerRadius = 20
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        refreshDataSource()
    }
    
    func refreshDataSource() {
        var arrayCellViewModels = [BaseCellViewModel]()
        
//        let shortEventModel = EventModel.init(eventID: eventModel.eventID!, name: eventModel.name!, shortDescr: eventModel.shortDescr!, dateString: eventModel.dateString)
//        
//        let didSelect: ((BaseCellViewModel) -> Void) = { [weak self] (viewModel) in
//            self?.didSelectEvent(viewModel: viewModel)
//        }
        
        let authLabel = AuthLabelViewModel()
        arrayCellViewModels.append(authLabel)
        
        //let authViewModel = AuthCellViewModel()
        let authTextFieldUsernameModel = AuthTextFieldViewModel(iconName: "login_icon", placeholderText: "Username")
        //authTextFieldUsername.configurationTextField(placeholder: "Username", imageName: "login_icon")
        authTextFieldUsernameModel.newTextClosure = { (currentText) in
            self.usernameText = currentText
        }
        arrayCellViewModels.append(authTextFieldUsernameModel)
        
        let authTextFieldPasswordModel = AuthTextFieldViewModel(iconName: "pass_icon", isSecure: true, placeholderText: "Password")
        arrayCellViewModels.append(authTextFieldPasswordModel)
        
        authTextFieldPasswordModel.newTextClosure = { (currentText) in
            self.passwordText = currentText
        }
        
        let authButtonModel = AuthButtonViewModel()
        arrayCellViewModels.append(authButtonModel)

        
        authButtonModel.actionClosure = { () in
            if !(self.usernameText.isEmpty || self.passwordText.isEmpty) {
                print ("Username: " + self.usernameText)
                print ("Password: " + self.passwordText)
                if let nextViewController = UIStoryboard(name: "ATIStoryboard", bundle: nil).instantiateInitialViewController() {
                    nextViewController.modalTransitionStyle = .crossDissolve
                    self.present(nextViewController, animated: true, completion: nil)
                }
            }
        }
        //cell.configurationTextField(placeholder: "Username", imageName: "login_icon")

        tableManager.tableView = tableView
        tableManager.arrayViewModels = arrayCellViewModels
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


//extension AuthViewController: UITableViewDelegate, UITableViewDataSource {
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: authCellId, for: indexPath) as? AuthTableViewCell else {
//            fatalError("Error convert cell for AuthViewController")
//        }
//        return cell
//    } 
//}
