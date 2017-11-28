//
//  NetworkDispatcher.swift
//  NetworkDemo
//
//  Created by Max Rogers on 11/28/17.
//  Copyright © 2017 Max Rogers. All rights reserved.
//

import Foundation

class NetworkDispatcher: NbaAPIClient {
    
    // MARK: - Properties
    
    private let teamStandingsRequest: TeamStandingsRequest
    
    // MARK: - Initialization
    
    required init(request: TeamStandingsRequest) {
        self.teamStandingsRequest = request
    }
    
    // MARK: - Network Request
    
    func requestTeamStandings(with standingsRequest: TeamStandingsRequest, onSuccess: @escaping NbaStandingsCallback, onFailure: @escaping (NetworkErrorCallback)) {
        
    }
    
}
