//
//  MutableArray+Tests.swift
//  SwiftCommons
//
//  Created by Yusuke on 11/28/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import Foundation

import XCTest
@testable import SwiftCommons

class MutableArray_Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_insertHead() {
        
        var array: [Int] = []
        array.insertHead(0)
        XCTAssertEqual(array, [0])
        
        array.insertHead(1)
        XCTAssertEqual(array, [1, 0])
    }
}
