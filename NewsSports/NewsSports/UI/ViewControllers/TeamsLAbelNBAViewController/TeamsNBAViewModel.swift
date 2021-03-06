//
//  TeamsNBAViewModel.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 11.12.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import Foundation

protocol TeamsNBAViewModelProtocol: AnyObject {
    var teams: [Team] { get set }
    
    func fetchTeams(completion: @escaping ((Error?) -> ()))
}

class TeamsNBAViewModel: TeamsNBAViewModelProtocol {
    
    
    private var teamListResponse: TeamListResponse?
    var teams: [Team] = []
    
    private let fetcher: SportFetcherTeamsProtocol
    //нужен фетчер jr
    // и метод init
    
    init( fetcher: SportFetcherTeamsProtocol) {
        self.fetcher = fetcher
  
    }
    
    func fetchTeams(completion: @escaping ((Error?) -> ())) {
      
        fetcher.fetchTeams() { [weak self] result in
            switch result {
            case .success(let teamListResponse):
                self?.teamListResponse = teamListResponse
                self?.teams = teamListResponse.data ?? []
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
}

