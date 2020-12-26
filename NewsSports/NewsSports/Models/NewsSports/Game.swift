//
//  Game.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 22.11.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import Foundation

class Game: Codable {
    var id: Int?
    var date: String?
    var homeTeamScore: Int?
    var visitorTeamScore: Int?
    var season : Int?
    var period: Int?
    var status: String?
    var time: String?
    var postseason: Bool?
    var homeTeam: Team?
    var visitorTeam: Team? // все пооля делаем опциональными, так как вдруг от сервака поле не придет - тогда будет крэжш, если поле обязательное а не опцион
}
////Еу Еу бро, как сделаешь - пиши
//создай фетчер , вьюмодельку GamesListViewModel
//контроллер GamesListVC
//все получится!


