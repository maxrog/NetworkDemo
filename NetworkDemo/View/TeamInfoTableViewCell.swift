//
//  TeamInfoTableViewCell.swift
//  NetworkDemo
//
//  Created by Max Rogers on 11/29/17.
//  Copyright © 2017 Max Rogers. All rights reserved.
//

import UIKit

class TeamInfoTableViewCell: UITableViewCell, ConfigurableCell {
    
    // MARK: - Properties
    
    @IBOutlet weak var teamStandingLabel: UILabel!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var winCountLabel: UILabel!
    @IBOutlet weak var lossCountLabel: UILabel!
    
    typealias T = TeamStat
    var model: TeamStat?
    
    func configure(with model: TeamStat) {
        self.model = model
        teamNameLabel.text = "\(model.city) \(model.name)"
        teamStandingLabel.text = model.standing
        winCountLabel.text = "W \(model.wins)   "
        lossCountLabel.text = "L \(model.losses)"
    }
    
    
    
}
