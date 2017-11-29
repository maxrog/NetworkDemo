//
//  LeagueManager.swift
//  NetworkDemo
//
//  Created by Max Rogers on 11/28/17.
//  Copyright © 2017 Max Rogers. All rights reserved.
//

import Foundation

struct LeagueManager {
    
    // MARK: - Properties
    
    let allTeams: [TeamStat]
    var eastTeams: [TeamStat] {
        return allTeams.filter { $0.conference == "Eastern" }
            .sorted { Int($0.standing)! < Int($1.standing)!  }
    }
    var westTeams: [TeamStat] {
        return allTeams.filter { $0.conference == "Western" }
            .sorted { Int($0.standing)! < Int($1.standing)!  }
    }
    
    
}
