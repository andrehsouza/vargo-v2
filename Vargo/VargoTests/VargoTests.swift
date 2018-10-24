//
//  VargoTests.swift
//  VargoTests
//
//  Created by Andre Souza on 22/10/2018.
//  Copyright © 2018 Andre Souza. All rights reserved.
//

import XCTest
import Alamofire
@testable import Vargo

class VargoTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFeedRequest() {
        let url = VUrl.path(for: .feed(page: 1))
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        config.timeoutIntervalForResource = 30
        let alamoFireManager = Alamofire.SessionManager(configuration: config)
        
        alamoFireManager.request(url, method: .get, encoding: JSONEncoding.default).validate(statusCode: 200..<300).responseJSON { response in
            XCTAssert((response.data == nil) || (response.result.value is Feed))
        }
    }
    
    func testRelatedVideosRequest() {
        let url = VUrl.path(for: .relatedVideos(page: 1))
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        config.timeoutIntervalForResource = 30
        let alamoFireManager = Alamofire.SessionManager(configuration: config)
        
        alamoFireManager.request(url, method: .get, encoding: JSONEncoding.default).validate(statusCode: 200..<300).responseJSON { response in
            XCTAssert((response.data == nil) || (response.result.value is Feed))
        }
    }

}
