//
//  VargoUITests.swift
//  VargoUITests
//
//  Created by Andre Souza on 22/10/2018.
//  Copyright © 2018 Andre Souza. All rights reserved.
//

import XCTest
import Foundation

class VargoUITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        
    }

    func testShowLoadingOnRequest() {
        let loadingView = app.activityIndicators["loadingView"]
        XCTAssertTrue(loadingView.exists)
    }
    
    func testTapRowAndShareContent() {
        app.tables.cells.firstMatch.tap()
        app.navigationBars.buttons["shareBarButtonItem"].tap()
        let activityList = app.otherElements["ActivityListView"]
        XCTAssertTrue(activityList.exists)
    }
    
    func testEndlessScrollFeedtableview() {
        let loadingView = app.activityIndicators["loadingView"]
        while loadingView.exists {
            app.swipeUp()
        }
    }
    
    func testLookForVideoRowAndTapThenClickPlay() {
        let feedTableView = app.tables["feedTableView"]

        let promise = expectation(description: "Wait for table cells")
        
        for i in stride(from: 0, to: feedTableView.cells.count , by: 1) {
            let tableCell = feedTableView.cells.element(boundBy: i)
            if tableCell.exists && !tableCell.frame.isEmpty {
                tableCell.tap()
                
                if i == (feedTableView.cells.count - 1) {
                    promise.fulfill()
                }
                
                app.navigationBars.buttons.element(boundBy: 0).tap()
            } else {
                app.swipeUp()
            }
        }
        
        waitForExpectations(timeout: 20, handler: nil)
        XCTAssertTrue(true, "Finished validating the table cells")
    }
    
    func testShowFenceViewOnErrorConnection() {
        let loadingView = app.otherElements["fenceView"]
        XCTAssertTrue(loadingView.exists)
    }

}
