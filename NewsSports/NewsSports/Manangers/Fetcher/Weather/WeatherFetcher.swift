//
//  weatherFetcher.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 10.11.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import Foundation

protocol WeatherFetcherProtocol: AnyObject {
    func fetchWeather(searechText:String, response: @escaping (Result<[Weather],Error>) -> Void)
    func fetchSearchWeather(urlString: String, responce: @escaping (Result<Weather, Error>) -> Void)
}

class WeatherFetcher {
    let weatherService: WeatherService
    
    //MARK: - Initialization
    
    required init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }
    
    func fetchWeather(searchText: String, completion: @escaping ((Result<WeatherResponse,Error>) -> ())) {
        let url = "https://api.openweathermap.org/data/2.5/weather?q=\(searchText)&appid=\(Constants.weatherAPIKey)"
        weatherService.request(urlStrring: url) { result in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                do {
                    let weatherResponse = try
                        CustomJSONDecoder().decode(WeatherResponse.self, from:data)
                    completion(.success(weatherResponse))
                }  catch let DecodingError.dataCorrupted(context) {
                    print(context)
                    completion(.failure(NSError(domain: "Error", code: -999, userInfo: [NSLocalizedDescriptionKey : context])))
                } catch let DecodingError.keyNotFound(key, context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                    completion(.failure(NSError(domain: "Error", code: -999, userInfo: [NSLocalizedDescriptionKey : context])))
                } catch let DecodingError.valueNotFound(value, context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                    completion(.failure(NSError(domain: "Error", code: -999, userInfo: [NSLocalizedDescriptionKey : context])))
                } catch let DecodingError.typeMismatch(type, context)  {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                    completion(.failure(NSError(domain: "Error", code: -999, userInfo: [NSLocalizedDescriptionKey : context])))
                } catch {
                    print("error: ", error)
                    completion(.failure(error))
                }
            }
        }
    }
}
