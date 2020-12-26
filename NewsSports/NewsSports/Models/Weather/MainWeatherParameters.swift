//
//  MainWeatherParameters.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 11.11.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import Foundation


class MainWeatherParameters: Codable {
    var temp: Double?
    var feelsLike: Double?
    var tempMin: Double?
    var tempMax: Double?
    var pressure: Int?
    var humidity: Int?
    var seaLevel: Int?
    var grndLevel: Int?
}


