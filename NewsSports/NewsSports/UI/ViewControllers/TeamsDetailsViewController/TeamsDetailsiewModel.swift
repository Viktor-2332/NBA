//
//  TeamsDetailsViewModel.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 03.12.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import Foundation

protocol TeamsDetailsViewModelProtocol : AnyObject {
    var team: Team? { get }
    
    func fetchTeamDetails(completion: @escaping ((Error?) ->()))
}

class TeamsDetailsViewModel: TeamsDetailsViewModelProtocol {
    
    var teamID: Int?
    var team: Team?
    private let fetcher: SportFetcherTeamsProtocol
    
    //MARK:  - Initialization
    
    init(teamID: Int?, fetcher: SportFetcherTeamsProtocol) {
        self.fetcher = fetcher
        self.teamID = teamID
    }
    
    
    //MARK: - TeamsDetailsViewModelProtocol
    
    func fetchTeamDetails(completion: @escaping ((Error?) ->())) {
        guard let teamID = teamID else {
            assertionFailure("Team id should be defined")
            return
        }
        fetcher.fetchTeam(id: teamID) { result in
            switch result {
            case .success(let team):
                self.team = team
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
}
