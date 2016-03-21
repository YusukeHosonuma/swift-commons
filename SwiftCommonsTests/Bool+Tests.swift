//
//  Bool+Tests.swift
//  SwiftCommons
//
//  Created by Yusuke on 3/21/16.
//  Copyright © 2016 Yusuke. All rights reserved.
//

import XCTest
@testable import SwiftCommons

class Bool_Tests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func test_stringValue() {
        XCTAssertEqual(true.stringValue(), "true")
        XCTAssertEqual(false.stringValue(), "false")
    }
}
