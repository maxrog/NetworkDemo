//
//  XCTestCase.swift
//  NetworkDemoTests
//
//  Created by Max Rogers on 11/29/17.
//  Copyright © 2017 Max Rogers. All rights reserved.
//

import XCTest

extension XCTestCase {
    
    // MARK: - Helper Methods
    
    func loadStubFromBundle(withName name: String, extension: String) -> Data {
        let bundle = Bundle(for: classForCoder)
        let url = bundle.url(forResource: name, withExtension: `extension`)
        
        return try! Data(contentsOf: url!)
    }
    
}
