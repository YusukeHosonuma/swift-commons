//
//  SequenceTypeTests.swift
//  SwiftCommons
//
//  Created by Yusuke on 11/21/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import XCTest
@testable import SwiftCommons

class SequenceTypeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_group() {
        
        var array: [Int]
        
        array = [1, 1 ,1, 2, 3, 3]
        XCTAssertEqual(array.group(), [[1, 1, 1], [2], [3, 3]])
        
        array = []
        XCTAssertEqual(array.group(), [])
    }
    
    func test_groupBy() {
        
        var array: [Int]
        
        array = [1, 1 ,1, 2, 3, 3]
        XCTAssertEqual(array.groupBy{ $0 == $1 }, [[1, 1, 1], [2], [3, 3]])
        XCTAssertEqual(array.groupBy{ $0 != $1 }, [[1], [1], [1, 2, 3], [3]])
        
        array = []
        XCTAssertEqual(array.groupBy{ $0 == $1 }, [])
    }
}
