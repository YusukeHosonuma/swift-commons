//
//  FunctionsTests.swift
//  SwiftCommons
//
//  Created by Yusuke on 8/25/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import XCTest

class FunctionsTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func test_isOdd_isEven() {
        
        // even numbers
        XCTAssertTrue(isEven(0))
        XCTAssertTrue(isEven(2))
        XCTAssertTrue(isEven(4))
        XCTAssertFalse(isOdd(0))
        XCTAssertFalse(isOdd(2))
        XCTAssertFalse(isOdd(4))
        
        // odd numbers
        XCTAssertTrue(isOdd(1))
        XCTAssertTrue(isOdd(3))
        XCTAssertTrue(isOdd(5))
        XCTAssertFalse(isEven(1))
        XCTAssertFalse(isEven(3))
        XCTAssertFalse(isEven(5))
    }
    
    func test_ngt() {

        XCTAssertEqual(-2, ngt(2))
        XCTAssertEqual(2, ngt(-2))
    }
}
