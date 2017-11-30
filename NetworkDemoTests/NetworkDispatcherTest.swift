//
//  NetworkDispatcherTest.swift
//  NetworkDemoTests
//
//  Created by Max Rogers on 11/29/17.
//  Copyright © 2017 Max Rogers. All rights reserved.
//

import XCTest
@testable import NetworkDemo

class NetworkDispatcherTest: XCTestCase {
    
    // MARK: - Properties
    
    var leagueManager: LeagueManager!
    
    // MARK: - Set Up & Tear Down
    
    override func setUp() {
        super.setUp()
        
        let data = loadStubFromBundle(withName: "networkResponse", extension: "json")
        let teamStats = JSONParser.parseTeamStandings(with: data)
        leagueManager = LeagueManager(allTeams: teamStats)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Tests for Team Count
    
    func testNumberOfTeams() {
        XCTAssertEqual(leagueManager.allTeams.count, 30)
        XCTAssertEqual(leagueManager.eastTeams.count, 15)
        XCTAssertEqual(leagueManager.westTeams.count, 15)
    }
    
    
    
    
}
