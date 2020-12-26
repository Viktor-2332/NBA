//
//  CUstomJSONDecoder.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 30.11.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import Foundation

class CustomJSONDecoder: JSONDecoder {
    
    override init() {
        super.init()
        keyDecodingStrategy = .convertFromSnakeCase
    }
}
// для конвертирования Json свойс с подчеркиванием  в одно слово, ТРИПЕР: - visitor_team в visitorTeam
