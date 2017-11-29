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
    
    func requestTeamStandings(onSuccess: @escaping NbaStandingsCallback, onFailure: @escaping (NetworkErrorCallback)) {
        guard let url = teamStandingsRequest.endpointURL else { return }
        var request = URLRequest(url: url)
        
        request.addValue(teamStandingsRequest.header.first!.key, forHTTPHeaderField: teamStandingsRequest.header.first!.value)

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let _ = error {
                onFailure(.failedRequest)
            } else if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    onSuccess(JSONParser.parseTeamStandings(with: data))
                } else {
                    onFailure(.failedRequest)
                }
            } else {
                onFailure(.unknown)
            }
        }
        
        
    }
    
}
