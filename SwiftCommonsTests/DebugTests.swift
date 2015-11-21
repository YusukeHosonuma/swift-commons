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
        Debug.timePrint {
            NSThread.sleepForTimeInterval(0.1)
        }
        Debug.timePrint("Thread sleep 0.1s") {
            NSThread.sleepForTimeInterval(0.1)
        }
        Debug.t("Short") {
            let _ = [1...100000].map{ String($0) }
        }
    }
    
    func test_debugLogs() {
        
        // use normal
        Debug.debug("debug message")
        Debug.info("info message")
        Debug.warn("warn message")
        Debug.error("error message")
        
        // use shortcut
        D.prefix = "🍺"
        D.d("short debug message")
        D.i("short info message")
        D.w("short warn message")
        D.e("short error message")
    }
}
