//
//  DayObject.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 30.11.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import Foundation

class DayObject: Codable {
    var dayName: String?
    var dayNumber: Int?
    var formattedParameter: String?
    
    init(dayName: String?, dayNumber: Int?, formattedParameter: String?) {
        self.dayName = dayName
        self.dayNumber = dayNumber
        self.formattedParameter = formattedParameter
    }
}
