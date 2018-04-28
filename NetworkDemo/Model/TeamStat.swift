//
//  TeamStat.swift
//  NetworkDemo
//
//  Created by Max Rogers on 11/28/17.
//  Copyright © 2017 Max Rogers. All rights reserved.
//

import Foundation

struct TeamStat {
    
    // MARK: - Properties
    
    let conference: String
    let city: String
    let name: String
    let nameAbbrev: String
    let standing: String
    let wins: String
    let losses: String
    
    // MARK: - Initialization
    
    init?(forConferece confName: String, withData json: [String : Any]) {
        
        // Team information
        guard let teamInfo = json["team"] as? [String : Any],
            let city = teamInfo["City"] as? String,
            let name = teamInfo["Name"] as? String,
            let abbrev = teamInfo["Abbreviation"] as? String
            else { return nil }
        
        // Team stats
        guard let teamStats = json["stats"] as? [String : Any],
        let standing = json["rank"] as? String,
        let wins = teamStats["Wins"] as? [String : Any],
        let winCount = wins["#text"] as? String,
        let losses = teamStats["Losses"] as? [String : Any],
        let lossCount = losses["#text"] as? String
            else { return nil }
        
        self.conference = confName
        self.city = city
        self.name = name
        self.nameAbbrev = abbrev
        self.standing = standing
        self.wins = winCount
        self.losses = lossCount
    }
    
}


