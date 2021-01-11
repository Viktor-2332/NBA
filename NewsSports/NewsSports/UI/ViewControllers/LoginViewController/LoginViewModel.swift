//
//  LoginViewModel.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 28.12.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import Foundation

protocol LoginViewModelProtocol {
    func login(loginRegister: LoginRegister,  completion: @escaping (Error?) -> ())
}


class LoginViewModel:LoginViewModelProtocol {
    
    
    var login = LoginRegister()
    var networkServise = NetworkSevice()
    
    func login(loginRegister: LoginRegister, completion: @escaping (Error?) -> ()) {
        self.login = loginRegister
        print("gistering...\n email:\(loginRegister.email)")
        networkServise.request(urlStrring: "https://www.balldontlie.io/api/v1/games") {
            result in
            switch result {
            case.failure(let error):
                completion(error)
            case .success(_):
                print("SUCCESS!!!! email:\(loginRegister.email)")
                UserDefaults.standard.set(true, forKey: Constants.isUserLoginInKey)
                completion(nil)
                }
            }
        }
    }
