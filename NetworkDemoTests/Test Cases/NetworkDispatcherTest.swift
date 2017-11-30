//
//  NetworkDispatcherTest.swift
//  NetworkDemoTests
//
//  Created by Max Rogers on 11/29/17.
//  Copyright © 2017 Max Rogers. All rights reserved.
//

import XCTest
import Mockingjay
import Quick
import Nimble
@testable import NetworkDemo


class NetworkDispatcherTest: XCTestCase {
    
    let header = ["Basic cm9nZXIwNDg6dkZWLTRNVi1hVzYtYVpk" : "Authorization"]
    let urlString = "https://api.mysportsfeeds.com/v1.1/pull/nba/2017-2018-regular/conference_team_standings.json?teamstats=W,L"
    var teamRequest: TeamStandingsRequest!
    var dispatcher: NetworkDispatcher!
    
    override func setUp() {
        super.setUp()
        mockingjayRemoveStubOnTearDown = true
        teamRequest = TeamStandingsRequest(urlString: urlString, header: header)
        dispatcher = NetworkDispatcher(request: teamRequest)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test a Network Error
    
    func testNetworkError() {
        var returnedStats: [TeamStat]? = []
        let error = NSError(domain: "Network Error", code: 404, userInfo: nil)
        
        self.stub(everything, failure(error))
        
        dispatcher.requestTeamStandings(onSuccess: { (teamStats) in
            returnedStats = teamStats
        }) { (_) in
            returnedStats = nil
        }
    
        expect(returnedStats).toEventually(beNil())
    }
    
    // MARK: - Test a Network Success
    
    func testNetworkSuccess() {
        var returnedStats: [TeamStat]?
        let data = loadStubFromBundle(withName: "networkResponse", extension: "json")
        
        self.stub(everything, jsonData(data))
        
        dispatcher.requestTeamStandings(onSuccess: { (teamStats) in
            returnedStats = teamStats
        }) { (_) in
            returnedStats = nil
        }
        
        expect(returnedStats).toEventuallyNot(beNil())
    }
    
}
