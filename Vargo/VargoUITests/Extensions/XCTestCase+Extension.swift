//
//  XCTestCase+Extension.swift
//  VargoUITests
//
//  Created by André Souza on 24/10/18.
//  Copyright © 2018 Andre Souza. All rights reserved.
//

import XCTest

extension XCTestCase {
    
    func wait(for duration: TimeInterval) {
        let waitExpectation = expectation(description: "Waiting")
        
        let when = DispatchTime.now() + duration
        DispatchQueue.main.asyncAfter(deadline: when) {
            waitExpectation.fulfill()
        }
        
        // We use a buffer here to avoid flakiness with Timer on CI
        waitForExpectations(timeout: duration + 0.5)
    }
}
