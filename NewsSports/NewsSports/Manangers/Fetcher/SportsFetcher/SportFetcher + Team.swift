//
//  SportFetcher + Team.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 03.12.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import Foundation
protocol SportFetcherTeamsProtocol: AnyObject {
    func fetchTeam(id: Int, completion: @escaping (Result<Team, Error>) -> Void)
    func fetchTeams(completion: @escaping (Result<TeamListResponse,Error>) -> Void)
}
extension SportFetcher: SportFetcherTeamsProtocol {
    func fetchTeams(completion: @escaping (Result<TeamListResponse, Error>) -> Void) {
        let url = "https://www.balldontlie.io/api/v1/teams"
        networkService.request(urlStrring: url) { (result) in
            switch result {
            case .success(let data):
                do {
                    let sport = try
                        CustomJSONDecoder().decode(TeamListResponse.self, from: data)
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
                print("Error reguesting data: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
    
    func fetchTeam(id: Int, completion: @escaping (Result<Team, Error>) -> Void) {
        let url = "https://www.balldontlie.io/api/v1/teams/\(id)"
            networkService.request(urlStrring: url) { (result) in
                switch result {
                case .success(let data):
                    do {
                        let sport = try
                            CustomJSONDecoder().decode(Team.self, from: data)
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
                    print("Error reguesting data: \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }
        }
    }
