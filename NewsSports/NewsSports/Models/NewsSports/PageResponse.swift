//
//  PageResponse.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 22.11.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import Foundation

class PageResponse: Codable {
    var totalPages: Int?
    var currentPages: Int?
    var nextPage: Int?
    var perPage: Int?
    var totalCount: Int?
    
}
