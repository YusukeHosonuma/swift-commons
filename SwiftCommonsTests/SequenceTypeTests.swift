//
//  SequenceTypeTests.swift
//  SwiftCommons
//
//  Created by Yusuke on 11/21/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import XCTest
@testable import SwiftCommons

func XCTAssertEqualArray<T: Equatable>(_ e1: [[T]], _ e2: [[T]]) {
    let isEqual = zip(e1, e2).reduce(true) { $0 && ($1.0 == $1.1) }
    XCTAssertTrue(isEqual, "\(e1) is not equal to \(e2)")
}

class SequenceTypeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_last() {
        XCTAssertEqual([].replaceLast(4), [4])
        XCTAssertEqual([1, 2, 3].replaceLast(4), [1, 2, 4])
    }
    
    func test_group() {
        
        var array: [Int]
        
        array = [1, 1 ,1, 2, 3, 3]
        XCTAssertEqualArray(array.group(), [[1, 1, 1], [2], [3, 3]])
        
        XCTAssertEqualArray([[1, 2, 3]], [[1, 2, 3]])
        
        array = []
        XCTAssertEqualArray(array.group(), [])
    }
    
    func test_groupBy() {
        
        var array: [Int]
        
        array = [1, 1 ,1, 2, 3, 3]
        XCTAssertEqualArray(array.groupBy(==), [[1, 1, 1], [2], [3, 3]])
        XCTAssertEqualArray(array.groupBy(!=), [[1], [1], [1, 2, 3], [3]])
        
        array = []
        XCTAssertEqualArray(array.groupBy(==), [])
    }
    
    func test_concat() {
        
        var array: [[Int]]
        
        array = [[1, 1, 1], [2], [3, 3]]
        XCTAssertEqual(array.concat(), [1, 1, 1, 2, 3, 3])
        
        array = []
        XCTAssertEqual(array.concat(), [])
    }
}
