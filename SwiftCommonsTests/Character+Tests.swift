//
//  Character+Tests.swift
//  SwiftCommons
//
//  Created by Yusuke on 2017/01/11.
//  Copyright © 2017 Yusuke. All rights reserved.
//

import XCTest
@testable import SwiftCommons

class Character_Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_isDigit() {
        let c0: Character = "0"
        let c1: Character = "1"
        let c2: Character = "2"
        let c3: Character = "3"
        let c4: Character = "4"
        let c5: Character = "5"
        let c6: Character = "6"
        let c7: Character = "7"
        let c8: Character = "8"
        let c9: Character = "9"
        let cX: Character = "x"
        XCTAssertTrue(c0.isDigit)
        XCTAssertTrue(c1.isDigit)
        XCTAssertTrue(c2.isDigit)
        XCTAssertTrue(c3.isDigit)
        XCTAssertTrue(c4.isDigit)
        XCTAssertTrue(c5.isDigit)
        XCTAssertTrue(c6.isDigit)
        XCTAssertTrue(c7.isDigit)
        XCTAssertTrue(c8.isDigit)
        XCTAssertTrue(c9.isDigit)
        XCTAssertFalse(cX.isDigit)
    }
}
