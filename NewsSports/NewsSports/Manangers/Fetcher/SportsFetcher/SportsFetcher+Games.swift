//
//  SportsFetcher+Games.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 03.12.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import Foundation

protocol SportFetcherGamesProtocol: AnyObject {
    func fetchAllGames(day: DayObject, completion: @escaping (Result<GameListResponse, Error>) -> Void)
}

extension SportFetcher: SportFetcherGamesProtocol {
    func fetchAllGames(day: DayObject, completion: @escaping (Result<GameListResponse, Error>) -> Void) {
        let url = "https://www.balldontlie.io/api/v1/games?dates[]=\(day.formattedParameter ?? "")"
        print("[TEST] \(url)")
        networkService.request(urlStrring: url) { (result) in
            switch result {
            case .success(let data):
                do {
                    let sport = try
                        CustomJSONDecoder().decode(GameListResponse.self, from: data)
                    completion(.success(sport))
                } catch let DecodingError.dataCorrupted(context) {
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
            case .failure(let error):
                print("Error reguisting data: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
}
