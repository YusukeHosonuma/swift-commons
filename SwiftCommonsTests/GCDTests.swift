//
//  GCDTests.swift
//  SwiftCommons
//
//  Created by Yusuke on 8/30/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import XCTest
@testable import SwiftCommons

class GCDTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_dispatchAfter() {
        
        let expect = expectationWithDescription("")
        dispatchAfter(delay: 0.1) {
            expect.fulfill()
        }
        waitForExpectationsWithTimeout(1.0, handler: nil)
    }
    
    func test_dispatchAsync() {
        
        let highDefault = expectationWithDescription("")
        dispatchAsync(.High) {
            highDefault.fulfill()
        }
        
        let expectDefault = expectationWithDescription("")
        dispatchAsync(.Default) {
            expectDefault.fulfill()
        }
        
        let expectLow = expectationWithDescription("")
        dispatchAsync(.Low) {
            expectLow.fulfill()
        }
        
        let expectBackground = expectationWithDescription("")
        dispatchAsync(.Background) {
            expectBackground.fulfill()
        }
        
        let expectMain = expectationWithDescription("")
        dispatchAsync(.Main) {
            expectMain.fulfill()
        }
        
        waitForExpectationsWithTimeout(1.0, handler: nil)
    }
    
    func test_dispatchSync() {
        
        let highDefault = expectationWithDescription("")
        dispatchSync(.High) {
            highDefault.fulfill()
        }
        
        let expectDefault = expectationWithDescription("")
        dispatchSync(.Default) {
            expectDefault.fulfill()
        }
        
        let expectLow = expectationWithDescription("")
        dispatchSync(.Low) {
            expectLow.fulfill()
        }
        
        let expectBackground = expectationWithDescription("")
        dispatchSync(.Background) {
            expectBackground.fulfill()
        }
        
        let expectMain = expectationWithDescription("")
        dispatchAsync(.Default) {
            dispatchSync(.Main) {
                expectMain.fulfill()
            }
        }
        
        waitForExpectationsWithTimeout(1.0, handler: nil)
    }
}
