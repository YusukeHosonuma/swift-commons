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
        
        let expect = expectation(description: "")
        dispatchAfter(delay: 0.1) {
            expect.fulfill()
        }
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func test_dispatchAsync() {
        
        let highDefault = expectation(description: "")
        dispatchAsync(.high) {
            highDefault.fulfill()
        }
        
        let expectDefault = expectation(description: "")
        dispatchAsync(.default) {
            expectDefault.fulfill()
        }
        
        let expectLow = expectation(description: "")
        dispatchAsync(.low) {
            expectLow.fulfill()
        }
        
        let expectBackground = expectation(description: "")
        dispatchAsync(.background) {
            expectBackground.fulfill()
        }
        
        let expectMain = expectation(description: "")
        dispatchAsync(.main) {
            expectMain.fulfill()
        }
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func test_dispatchSync() {
        
        let highDefault = expectation(description: "")
        dispatchSync(.high) {
            highDefault.fulfill()
        }
        
        let expectDefault = expectation(description: "")
        dispatchSync(.default) {
            expectDefault.fulfill()
        }
        
        let expectLow = expectation(description: "")
        dispatchSync(.low) {
            expectLow.fulfill()
        }
        
        let expectBackground = expectation(description: "")
        dispatchSync(.background) {
            expectBackground.fulfill()
        }
        
        let expectMain = expectation(description: "")
        dispatchAsync(.default) {
            dispatchSync(.main) {
                expectMain.fulfill()
            }
        }
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}
