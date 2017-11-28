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
    
    private let urlString: String
    private let authUsername: String
    private let authPassword: String
    
    var endpointURL: URL? {
        return URL(string: urlString)
    }
    
}
