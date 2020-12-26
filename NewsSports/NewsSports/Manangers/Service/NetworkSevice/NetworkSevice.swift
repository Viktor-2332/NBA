//
//  NetworkSevice.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 22.11.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//


import Foundation

class NetworkSevice {
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
