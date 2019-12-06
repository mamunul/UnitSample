//
//  MockURLSessionDataTask.swift
//  SampleTests
//
//  Created by New User on 26/11/19.
//  Copyright © 2019 New User. All rights reserved.
//

import Foundation
@testable import UnitSample

class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    private (set) var resumeWasCalled = false
    
    func resume() {
        resumeWasCalled = true
    }
}
