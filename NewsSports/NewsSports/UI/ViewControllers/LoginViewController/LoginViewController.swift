//
//  LoginViewController.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 28.12.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var icomImage: UIImageView!

    @IBOutlet weak var LoginText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var headingLabel: UILabel!
    
    @IBOutlet weak var RegisterButton: UIButton!
    @IBOutlet weak var comeInButton: UIButton!
    
    private var loginViewModel =  LoginViewModel()
    private var loginviewModel : LoginViewModelProtocol = LoginViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
//        LoginText.text = "Данные для входа пользователя"
       
    }
    
    @IBAction func ForgotPasswordAction(_ sender: Any) {
    }
    
    @IBAction func ComenInAction(_ sender: Any) {
        
        
        let email = LoginText.text ?? ""
        let password = passwordText.text ?? ""
        loginViewModel.login.email = email
        loginViewModel.login.password = password
        UserDefaults.standard.set(true, forKey: Constants.isUserLoginInKey)
//        if let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
////            scene.setupRotVC()
        //        }
        if email.isEmpty == false, password.isEmpty == false  {
            if password.count > 8 {
                
                let loginRegister = LoginRegister(email: email, password: password)
                loginviewModel.login(loginRegister: loginRegister) { [weak self] error in
                    guard let self = self else { return }
                    if let error = error {
                        UIAlertController.show(title: "Error", message: error.localizedDescription, view: self)
                    } else {
                        self.navigationController?.popViewController(animated: true)
                    }
                }
            } else {
                UIAlertController.show(title: "Error", message: "Пароль должен быть больше 8 символов", view: self)
            }
        } else {
            UIAlertController.show(title: "Error", message: "all fields must be filled", view: self)
        }
        
    }
    
}

