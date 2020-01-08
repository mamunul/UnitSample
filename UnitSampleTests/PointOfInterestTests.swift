//
//  PointOfInterestTests.swift
//  UnitSampleTests
//
//  Created by New User on 11/12/19.
//  Copyright © 2019 New User. All rights reserved.
//

import CoreLocation
@testable import UnitSample
import XCTest

class PointOfInterestRequestTests: XCTestCase {
    let request = PointOfInterestRequest()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMakingUrlRequest() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let location = CLLocationCoordinate2D(latitude: 37.3293, longitude: -121.8893)
        let urlRequest = request.makeRequest(from: location)

        XCTAssertEqual(urlRequest.url?.scheme, "https")
        XCTAssertEqual(urlRequest.url?.host, "example.com")
        XCTAssertEqual(urlRequest.url?.query, "lat=37.3293&long=-121.8893")
    }

    func testParsingResponse() throws {
        let jsonData = "[{\"name\":\"My Location\"}]".data(using: .utf8)!
        let response = try request.parseResponse(data: jsonData)
        XCTAssertEqual(response, [PointOfInterest(name: "My Location")])
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
    }
}
