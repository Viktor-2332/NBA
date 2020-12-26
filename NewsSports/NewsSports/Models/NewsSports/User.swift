//
//  User.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 21.12.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import Foundation
class User: Codable {
    var name: String?
    var fullname: String?
    var email: String?
    
    init(name: String? = nil, fullname: String? = nil, email: String? = nil)  {
        self.name = name
        self.fullname = fullname
        self.email = email
    }
}
