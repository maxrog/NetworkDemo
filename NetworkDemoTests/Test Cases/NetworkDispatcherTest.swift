//
//  NetworkDispatcherTest.swift
//  NetworkDemoTests
//
//  Created by Max Rogers on 11/29/17.
//  Copyright © 2017 Max Rogers. All rights reserved.
//

import XCTest
import Mockingjay
@testable import NetworkDemo


class NetworkDispatcherTest: XCTestCase {
    
    let header = ["Basic cm9nZXIwNDg6dkZWLTRNVi1hVzYtYVpk" : "Authorization"]
    let urlString = "https://api.mysportsfeeds.com/v1.1/pull/nba/2017-2018-regular/conference_team_standings.json?teamstats=W,L"
    var teamRequest: TeamStandingsRequest!
    
    override func setUp() {
        super.setUp()
        mockingjayRemoveStubOnTearDown = true
        teamRequest = TeamStandingsRequest(urlString: urlString, header: header)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test a Network Error
    
    func testNetworkError() {
        let error = NSError(domain: "Network Error", code: 404, userInfo: nil)
        
        self.stub(everything, failure(error))
        
        let dispatcher = NetworkDispatcher(request: teamRequest)
        dispatcher.requestTeamStandings(onSuccess: { (_) in
            XCTAssert(false)
        }) { (_) in
            XCTAssert(true)
        }
    }
    
    
    
}
