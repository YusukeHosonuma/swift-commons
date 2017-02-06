//
//  UIColor+Tests.swift
//  SwiftCommons
//
//  Created by Yusuke on 8/25/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import XCTest
@testable import SwiftCommons

class UIColor_Tests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func test_fromHex() {
        
        let c = UIColor.fromHex("FF0000")
        print(c as Any)
        
        let c2 = UIColor.red
        print(c2)
        
        // upper case
        XCTAssertEqual(UIColor.fromHex("FF0000")!, UIColor.red)
        
        // lower case
        XCTAssertEqual(UIColor.fromHex("0000ff")!, UIColor.blue)
        
        // length != 6
        XCTAssertNil(UIColor.fromHex("12345"))
        XCTAssertNil(UIColor.fromHex("1234567"))
        
        // invalid char
        XCTAssertNil(UIColor.fromHex("XXYYZZ"))
    }
}
