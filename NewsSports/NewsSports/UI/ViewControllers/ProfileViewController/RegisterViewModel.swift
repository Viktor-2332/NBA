//
//  RegisterViewModel.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 21.12.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import Foundation

protocol RegisterViewModelProtocol {
    func register(registerObject: RegisterObject, completion: (Error?) -> ())
}

class RegisterViewModel: RegisterViewModelProtocol {
    var registerObject: RegisterObject?
    
    func register(registerObject: RegisterObject, completion: (Error?) -> ()) {
        self.registerObject = registerObject
        print("Registering... \n email:\(registerObject.email)")
        UserDefaults.standard.set(true, forKey: Constants.isUserLoginInKey)
        completion(nil)
    }
}

