//
//  weatherService.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 10.11.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import Foundation

class WeatherService{
    func request(urlStrring:String, completion: @escaping (Result<Data,Error>) -> Void) {
        guard let url = URL(string: urlStrring) else { return }
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else {return}
                completion(.success(data))
            }
        }.resume()
    }
}
