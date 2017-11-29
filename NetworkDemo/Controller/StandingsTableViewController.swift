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
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var leagueManager: LeagueManager? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }


    override func viewWillAppear(_ animated: Bool) {
        retrieveLeagueStats()
    }
    
    // MARK: - Tableview Datasource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let eastTeams = leagueManager?.eastTeams,
            let westTeams = leagueManager?.westTeams else { return 0 }
        
        if section == 0 {
            return eastTeams.count
        } else {
            return westTeams.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let teamCell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as? TeamInfoTableViewCell else { return UITableViewCell() }
        guard let eastTeams = leagueManager?.eastTeams,
            let westTeams = leagueManager?.westTeams else { return UITableViewCell() }
        
        if indexPath.section == 0 {
            teamCell.configure(with: eastTeams[indexPath.row])
        } else {
            teamCell.configure(with: westTeams[indexPath.row])
        }
        
        return teamCell
    }
        
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Eastern"
        } else {
            return "Western"
        }
    }

    // MARK: - Network Call
    
    func retrieveLeagueStats() {
        activityIndicator.startAnimating()
        let header = ["Basic cm9nZXIwNDg6dkZWLTRNVi1hVzYtYVpk" : "Authorization"]
        let urlString = "https://api.mysportsfeeds.com/v1.1/pull/nba/2017-2018-regular/conference_team_standings.json?teamstats=W,L"
        let request = TeamStandingsRequest(urlString: urlString, header: header)
        
        let dispatcher = NetworkDispatcher(request: request)
        
        dispatcher.requestTeamStandings(onSuccess: { (teamStats) in
            self.activityIndicator.stopAnimating()
            self.leagueManager = LeagueManager(allTeams: teamStats)
        }) { (error) in
            self.activityIndicator.stopAnimating()
            print("Show network error alert")
        }
    }

}
