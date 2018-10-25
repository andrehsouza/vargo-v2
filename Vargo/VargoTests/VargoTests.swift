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
        let service = APIService(with: url)
        service.getData({ (result: RequestResultType<Feed>) in
            switch result {
            case .success(let feed):
                XCTAssert(feed.items.count > 0, "Feed with list of items")
                break
            case .failure(let errorResponse):
                XCTAssert(!errorResponse.message.isEmpty, "Request error with message")
                break
            }
        })
    }
    
    func testJSONDecoder() throws {
        let bundle = Bundle.main
        guard let url = bundle.url(forResource: "Feed", withExtension: "json") else {
            XCTFail("Missing file: Feed.json")
            return
        }
        let jsonData = try Data(contentsOf: url)
        let feed = try JSONDecoder().decode(Feed.self, from: jsonData)
        XCTAssert(feed.totalPages > 0)
    }

}
