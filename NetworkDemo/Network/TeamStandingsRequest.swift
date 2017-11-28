//
//  TeamStandingsRequest.swift
//  NetworkDemo
//
//  Created by Max Rogers on 11/28/17.
//  Copyright © 2017 Max Rogers. All rights reserved.
//

import Foundation

struct TeamStandingsRequest {
    
    // MARK: - Properties
    
    private var urlString: String
    private var authUsername: String
    private var authPassword: String
    
    var endpointURL: URL? {
        return URL(string: urlString)
    }
    
}
