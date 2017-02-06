//
//  Dictionary+Tests.swift
//  SwiftCommons
//
//  Created by Yusuke on 4/12/16.
//  Copyright © 2016 Yusuke. All rights reserved.
//

import XCTest
@testable import SwiftCommons

class Dictionary_Tests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func test_create() {
  
// Compiler is crash in Xcode 8.0
//
//        let nilString: String? = nil
//
//        let dict = Dictionary<String, String>.create([
//            "key1" => "value1",
//            "key2" => "value2",
//            "key3" => nilString,
//        ])
//
//        XCTAssertEqual(dict["key1"], "value1")
//        XCTAssertEqual(dict["key2"], "value2")
//        XCTAssertNil  (dict["key3"])
    }
}
