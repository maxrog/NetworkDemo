//
//  JSONParser.swift
//  NetworkDemo
//
//  Created by Max Rogers on 11/28/17.
//  Copyright © 2017 Max Rogers. All rights reserved.
//

import Foundation

class JSONParser {
    
    // MARK: - Parse league standings
    
    static func parseTeamStandings(with data: Data) -> [TeamStat] {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            guard let jsonData = json as? [String : Any] else { return [] }
            guard let topLevel = jsonData["conferenceteamstandings"] as? [String : Any] else { return [] }
            guard let conferences = topLevel["conference"] as? [[String : Any]] else { return [] }
            
            return parseConferences(with: conferences)
            
        } catch let parseError {
            print("Error Parsing JSON", parseError)
        }
        return []
    }
    
    // MARK: - Parse the two conferences
    
    private static func parseConferences(with conferences: [[String : Any]]) -> [TeamStat] {
        
        var leagueStats: [TeamStat] = []
        
        for conference in conferences {
            guard let conferenceName = conference["@name"] as? String,
                let teams = conference["teamentry"] as? [[String : Any]] else { return [] }
            leagueStats.append(contentsOf: parseTeams(with: teams, for: conferenceName))
        }
        return leagueStats
    }

    // MARK: - Parse team information
    
    private static func parseTeams(with teams: [[String: Any]], for conferenceName: String) -> [TeamStat] {
        
        var leagueStats: [TeamStat] = []
        
        for teamJson in teams {
            if let teamStat = TeamStat(forConferece: conferenceName, withData: teamJson) {
                leagueStats.append(teamStat)
            }
        }
        return leagueStats
    }
    
}
