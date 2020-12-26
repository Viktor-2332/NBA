//
//  TeamListResponse.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 14.12.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import Foundation


class TeamListResponse: Codable {
    var data: [Team]?
    var meta: PageResponse?
}
