//
//  DebugTests.swift
//  SwiftCommons
//
//  Created by Yusuke on 11/22/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import XCTest
@testable import SwiftCommons

class DebugTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_time() {
        let time = Debug.time {
            NSThread.sleepForTimeInterval(0.1)
        }
        XCTAssertGreaterThan(time, 0.1)
        XCTAssertLessThan(time, 0.5)
    }
    
    func test_timePrint() {
        Debug.timePrint("[Debug][Time]") {
            NSThread.sleepForTimeInterval(0.1)
        }
    }
}
