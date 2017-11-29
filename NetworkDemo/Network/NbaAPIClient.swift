//
//  NbaAPIClient.swift
//  NetworkDemo
//
//  Created by Max Rogers on 11/28/17.
//  Copyright © 2017 Max Rogers. All rights reserved.
//

import Foundation

typealias NbaStandingsCallback = ([TeamStat]) -> Void
typealias NetworkErrorCallback = (NbaNetworkError) -> Void

protocol NbaAPIClient {
    func requestTeamStandings(onSuccess: @escaping NbaStandingsCallback,
                              onFailure: @escaping (NetworkErrorCallback))
}

// MARK: - Network Error Enum

enum NbaNetworkError: Error {
    case unknown
    case failedRequest
    case invalidResponse
}
