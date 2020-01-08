//
//  PasswordCheckerTests.swift
//  SampleTests
//
//  Created by New User on 26/11/19.
//  Copyright © 2019 New User. All rights reserved.
//

@testable import UnitSample
import XCTest

class PasswordCheckerTests: XCTestCase {
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_shortPassword() {
        let passwordChecker = PasswordChecker(password: "testrt")

        XCTAssertThrowsError(try passwordChecker.check()) { error in
            XCTAssertEqual(error as! PasswordError, PasswordError.short)
            XCTAssertNotEqual(error as! PasswordError, PasswordError.long)
        }
        let result = try? passwordChecker.check()
        XCTAssertNil(result)
    }

    func test_commonPassword() {
        let passwordChecker = PasswordChecker(password: "password")

        XCTAssertThrowsError(try passwordChecker.check()) { error in
            XCTAssertEqual(error as! PasswordError, PasswordError.customMessage(message: "custom error"))
        }

        let result = try? passwordChecker.check()
        XCTAssertNil(result)
    }

    func test_correctPassword() {
        let passwordChecker = PasswordChecker(password: "testrtert")

        let result = try? passwordChecker.check()

        XCTAssertNotNil(result)
        XCTAssertTrue(result!)
    }

    func test_longPassword() {
        let passwordChecker = PasswordChecker(password: "testrtertsfsafsafsaf")

        XCTAssertThrowsError(try passwordChecker.check()) { error in
            XCTAssertEqual(error as! PasswordError, PasswordError.long)
        }

        let result = try? passwordChecker.check()
        XCTAssertNil(result)
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
    }
}
