//
//  WeatherResponse.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 11.11.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import Foundation
//class LocationListResponse: Codable {
//    var info: ListInfo?
//    var results: [Location]?
//}
class Cloud: Codable {
    var all: Int?
}
class WeatherResponse: Codable {
    var weather: [Weather]?
    var main: MainWeatherParameters?
    var wind: Wind?
    var country: CountryData?
    var coord: Coordinate?
    var base: String?
    var visibility: Int?
    var clouds: Cloud?
    var dt: Int?
    var timezone: Int?
    var id: Int?
    var name: String?
    var cod: Int?
}

// TwoHorizontalLabelsTableViewCell
