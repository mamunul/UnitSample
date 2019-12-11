//
//  APILoaderTests.swift
//  UnitSampleTests
//
//  Created by New User on 11/12/19.
//  Copyright © 2019 New User. All rights reserved.
//

import XCTest
import Foundation
import CoreLocation
@testable import UnitSample

class APILoaderTests: XCTestCase {
    var loader:APIRequestLoader<PointOfInterestRequest>!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let request = PointOfInterestRequest()
        
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockUrlProtocol.self]
        let urlSession = URLSession(configuration:configuration)
        
        loader = APIRequestLoader(apiRequest: request, urlSession: urlSession)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testApiResponse() {

        let location = CLLocationCoordinate2D(latitude: 37.3293, longitude: -121.8893)
        let jsonData = "[{\"name\":\"My request\"}]".data(using: .utf8)!
        
        MockUrlProtocol.requestHandler = {request in
            XCTAssertEqual(request.url?.query?.contains("lat=37.3293"),true)
            return(HTTPURLResponse(),jsonData)
        }
        
        let expectation = XCTestExpectation(description: "response")
        loader.loadAPIRequest(requestData: location) { (pointsOfInterest, error) in
            XCTAssertEqual(pointsOfInterest, [PointOfInterest(name:"My request")])
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testApiResponse2() {

        let location = CLLocationCoordinate2D(latitude: 37.3293, longitude: -121.8893)
        let jsonData = "[{\"name\":,,::\"My request\"}]".data(using: .utf8)!
        
        MockUrlProtocol.requestHandler = {request in
            XCTAssertEqual(request.url?.query?.contains("lat=37.3293"),true)
            return(HTTPURLResponse(),jsonData)
        }
        
        let expectation = XCTestExpectation(description: "response")
        loader.loadAPIRequest(requestData: location) { (pointsOfInterest, error) in
            XCTAssertNil(pointsOfInterest)
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
    }

}
