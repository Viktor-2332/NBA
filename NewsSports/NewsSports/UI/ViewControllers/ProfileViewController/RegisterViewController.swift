//
//  RegisterViewController.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 21.12.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
////
//
import UIKit
//
class RegisterViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var nameText: UITextField!

    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var acauntLabel: UILabel!
    @IBOutlet weak var welcomLaibl: UIButton!
    
    private var profileviewModel: RegisterViewModelProtocol = RegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Данные для входа пользователя"
    }
    
    @IBAction func loginAction(_ sender: Any) {
        
        let email = emailText.text ?? ""
        let password = passwordText.text ?? ""
        let name = nameText.text  ?? ""
        if email.isEmpty == false, password.isEmpty == false, name.isEmpty == false  {
            if password.count > 8 {
                
                let registerObject = RegisterObject(email: email, name: name, password: password)
                profileviewModel.register(registerObject: registerObject) { [weak self] error in
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
        
//        if let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
//            scene.setupRootVC()
//        }
    }

}

