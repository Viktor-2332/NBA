//
//  Login.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 28.12.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import Foundation
class LoginRegister: Codable {
    var email : String?
    var password : String?
    
    init(email: String? = nil, password: String? = nil) {
        self.email = email
        self.password = password
    }
   
}
