//
//  NbaAPIClient.swift
//  NetworkDemo
//
//  Created by Max Rogers on 11/28/17.
//  Copyright © 2017 Max Rogers. All rights reserved.
//

import Foundation

typealias NbaStandingsCallback = ([teamStat]?) -> Void
typealias NetworkErrorCallback = (NbaNetworkError) -> Void

protocol NbaAPIClient {
    func requestTeamStandings(with standingsRequest: TeamStandingsRequest,
                              onSuccess: @escaping NbaStandingsCallback,
                              onFailure: @escaping (NetworkErrorCallback))
}

enum NbaNetworkError: Error {
    case unknown
    case failedRequest
    case invalidResponse
}
