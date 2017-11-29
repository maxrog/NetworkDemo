//
//  StandingsTableViewController.swift
//  NetworkDemo
//
//  Created by Max Rogers on 11/28/17.
//  Copyright © 2017 Max Rogers. All rights reserved.
//

import UIKit

class StandingsViewController: UITableViewController {
    
    // MARK: Properties

    var leagueManager: LeagueManager? {
        didSet {
            DispatchQueue.main.async {
                tableView.reloadData()
            }
        }
    }


    override func viewWillAppear(_ animated: Bool) {
        retrieveLeagueStats()
    }
    
    
    
    func retrieveLeagueStats() {
        let header = ["Basic cm9nZXIwNDg6dkZWLTRNVi1hVzYtYVpk" : "Authorization"]
        let urlString = "https://api.mysportsfeeds.com/v1.1/pull/nba/2017-2018-regular/conference_team_standings.json?teamstats=W,L"
        let request = TeamStandingsRequest(urlString: urlString, header: header)
        
        let dispatcher = NetworkDispatcher(request: request)
        
        dispatcher.requestTeamStandings(onSuccess: { (teamStats) in
            self.leagueManager = LeagueManager(allTeams: teamStats)
        }) { (error) in
            print("Show network error alert")
        }
    }

}
