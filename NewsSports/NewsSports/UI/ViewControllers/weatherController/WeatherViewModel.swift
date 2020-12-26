//
//  WeatherViewModel.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 11.11.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//
// создать в протоколе параметр search Text casei

import UIKit

enum Sections: String, CaseIterable {
    
    case custom
    case weather
    case main
    case wind
    case country
    case coord
    case base
    case visibility
    case clouds
    case dt
    case timezone
    case id
    case name
    case cod

}

protocol WeatherviewModelProtocol: AnyObject, UITableViewDelegate, UITableViewDataSource {
    var weather: WeatherResponse? {get}
    func fetchWeather(weatherSearchText: String, completion: @escaping ((Error?) ->()))
}

//protocol LocationViewModelProtocol: AnyObject {
//    var locations: [Location] {get}
//    var currentFilter: LocationFilters { get set }
class WeatherviewModel: NSObject, WeatherviewModelProtocol {
    var weatherSearchText: String?
    private(set) var weather: WeatherResponse?
   
    private let fetcherWeather: WeatherFetcher
    
    init(fetcherWeather: WeatherFetcher) {
        self.fetcherWeather = fetcherWeather
    }
    
    func fetchWeather(weatherSearchText: String, completion: @escaping ((Error?) -> ())) {
        fetcherWeather.fetchWeather(searchText: weatherSearchText)
        { result in
            switch result {
            case .success(let weather):
                self.weather = weather
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    //MARK: -  UITableViewDelegate, UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Sections.allCases[indexPath.section] {
        case .custom:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "GraficWeaherTableViewCell", for: indexPath) as? GraficWeaherTableViewCell,
                let weather = weather {
                let object = GraficWeaherTableViewCellObject(from: weather)
                cell.configure(object: object)
                return cell
            }

        case .weather:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell", for: indexPath) as? WeatherTableViewCell,
                let weather = weather {
                cell.configure(weathers: weather.weather ?? [])
                return cell
            }
        case .main:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "MainWeatherTableViewCell", for: indexPath) as? MainWeatherTableViewCell,
                let mainIfo = self.weather?.main {
                cell.configure(main: mainIfo)
                return cell
            }
        case .wind:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "WindWeatherTableViewCell", for: indexPath) as? WindWeatherTableViewCell,
                let windInfo = self.weather?.wind {
                cell.configure(wind: windInfo)
                return cell
            }
        case .country:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "CountryWeatherTableViewCell", for: indexPath) as? CountryWeatherTableViewCell,
                let countryInfo = self.weather?.country {
                cell.configure(country: countryInfo)
                return cell
            }
        case .coord:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "CoordWeatherTableviewCell", for: indexPath) as? CoordWeatherTableviewCell,
                let coordInfo = self.weather?.coord {
                cell.configure(coordinate: coordInfo)
                return cell
            }
        case .base:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TwoHorizontalLabelsTableViewCell", for: indexPath) as? TwoHorizontalLabelsTableViewCell {
                cell.configure(title: "Base", subtitle: self.weather?.base)
                return cell
            }
        case .visibility:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TwoHorizontalLabelsTableViewCell", for: indexPath) as? TwoHorizontalLabelsTableViewCell {
                cell.configure(title: "Visibility", subtitle: "\(self.weather?.visibility ?? 0)")
                return cell
            }
        case .clouds:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TwoHorizontalLabelsTableViewCell", for: indexPath) as? TwoHorizontalLabelsTableViewCell {
                cell.configure(title: "Clouds", subtitle: "\(self.weather?.clouds?.all ?? 0)")
                return cell
            }
        case .dt:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TwoHorizontalLabelsTableViewCell", for: indexPath) as? TwoHorizontalLabelsTableViewCell {
                cell.configure(title: "dt", subtitle: "\(self.weather?.dt ?? 0)")
                return cell
            }
            
        case .timezone:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TwoHorizontalLabelsTableViewCell", for: indexPath) as? TwoHorizontalLabelsTableViewCell {
                cell.configure(title: "timezone", subtitle: "\(self.weather?.timezone ?? 0)")
                return cell
            }
        case .id:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TwoHorizontalLabelsTableViewCell", for: indexPath) as? TwoHorizontalLabelsTableViewCell {
                cell.configure(title: "Weather Id", subtitle: "\(self.weather?.id ?? 0)")
                return cell
            }
        case .name:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TwoHorizontalLabelsTableViewCell", for: indexPath) as? TwoHorizontalLabelsTableViewCell
            {
                cell.configure(title: "Name", subtitle: self.weather?.name)
                return cell
            }
        case .cod:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TwoHorizontalLabelsTableViewCell", for: indexPath) as? TwoHorizontalLabelsTableViewCell {
                cell.configure(title: "Weather Response Code", subtitle: "\(self.weather?.cod ?? 0)")
                return cell
            }
        }
        return UITableViewCell()
    }
}
