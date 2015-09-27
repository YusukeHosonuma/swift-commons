//
//  Array+Tests.swift
//  SwiftCommons
//
//  Created by Yusuke on 8/24/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import XCTest
@testable import SwiftCommons

class Array_Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_subscript_orNil_get() {
        
        let array = [0, 1, 2]
        XCTAssertNil(array[orNil: -1])
        XCTAssertNil(array[orNil: 3])
        
        XCTAssertEqual(array[orNil: 0]!, 0)
        XCTAssertEqual(array[orNil: 1]!, 1)
        XCTAssertEqual(array[orNil: 2]!, 2)
        
        let emptyArray: [Int] = []
        XCTAssertNil(emptyArray[orNil: 0])
    }
    
    func test_inits() {
        XCTAssertEqual([], [0].inits()) // conforms to Haskell
        XCTAssertEqual([0, 1, 2, 3], [0, 1, 2, 3, 4].inits())
    }
    
    func test_tail() {
        XCTAssertEqual([], [0].tail()) // conforms to Haskell
        XCTAssertEqual([1, 2, 3, 4], [0, 1, 2, 3, 4].tail())
    }
    
    func test_take() {
        
        // empty
        let empty = [Int]()
        XCTAssertEqual([], empty.take(3))
        
        // middle
        let array = Array(0..<5)
        XCTAssertEqual([0, 1, 2], array.take(3))
        
        // max
        XCTAssertEqual([0, 1, 2, 3, 4], array.take(5))
        
        // over
        XCTAssertEqual([0, 1, 2, 3, 4], array.take(6))
    }
    
    func test_drop() {
        XCTAssertEqual([0, 1, 2, 3, 4].drop(0), [0, 1, 2, 3, 4])
        XCTAssertEqual([0, 1, 2, 3, 4].drop(4), [4])
        XCTAssertEqual([0, 1, 2, 3, 4].drop(5), [])
    }
    
    func test_foreach() {
        
        let s1 = NSMutableString(string: "1")
        let s2 = NSMutableString(string: "2")
        let array = [s1, s2]
        
        // append ! for all elements
        array.forEach{ $0.appendString("!") }
        
        XCTAssertEqual("1!", s1)
        XCTAssertEqual("2!", s2)
    }
    
    func test_reduce1() {
        XCTAssertEqual([0].reduce1{ $0 + $1 }, 0)
        XCTAssertEqual([0, 1, 2, 3, 4].reduce1{ $0 + $1 }, 10)
    }
    
    func test_foldl() {
        XCTAssertEqual(10, [1, 2, 3, 4].foldl(0){ $0 + $1 })
    }
    
    func test_foldr() {
        let newArray = [1, 2, 3, 4].foldr([Int]()) { (var acc, b) in
            acc.append(b)
            return acc
        }
        XCTAssertEqual([4, 3, 2, 1], newArray)
    }
}
