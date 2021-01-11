//
//  RegisterViewModel.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 21.12.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import Foundation

protocol RegisterViewModelProtocol {
    func register(registerObject: RegisterObject, completion: @escaping (Error?) -> ())
}

class RegisterViewModel: RegisterViewModelProtocol {
    var registerObject: RegisterObject?
    
    var networkService = NetworkSevice()
    
    func register(registerObject: RegisterObject, completion: @escaping (Error?) -> ()) {
        self.registerObject = registerObject
        print("Registering... \n email:\(registerObject.email)")
        networkService.request(urlStrring: "https://www.balldontlie.io/api/v1/games" /* ДЛЯ ТЕСТА  */) { result in
            switch result {
            case.failure(let error):
                completion(error) //  failure - это если ти Result надо возвращать, а тебе надо либо ошибку вернуть либо ничего, такое правило на 20 строке описно в замыкании
            case .success(_):
                print("SUCCESS!!!! email:\(registerObject.email)")
                UserDefaults.standard.set(true, forKey: Constants.isUserLoginInKey)
                completion(nil) //  success - это если ти Result надо возвращать, а тебе надо либо ошибку вернуть либо ничего, такое правило на 20 строке описно в замыкании
            }
        }
//        networkService.request(urlStrring: "www.pornohub.com") { result in
//
//        }
        
       
    }
}

