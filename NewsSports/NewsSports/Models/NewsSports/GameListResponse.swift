//
//  GameListResponse.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 22.11.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import Foundation
class GameListResponse: Codable {
    var data: [Game]?
    var meta: PageResponse?
    
}
