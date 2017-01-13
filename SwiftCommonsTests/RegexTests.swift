//
//  RegexTests.swift
//  SwiftCommons
//
//  Created by Yusuke on 2017/01/14.
//  Copyright © 2017 Yusuke. All rights reserved.
//

import XCTest
@testable import SwiftCommons

class RegexTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func test_matchFirst() {
        guard let matches: [Match] = Regex("[0-9]+")?.matches("090-1111-2222") else {
            XCTFail()
            return
        }
        XCTAssertEqual(matches.count, 3)
        XCTAssertEqual(matches[0].all, "090")
        XCTAssertEqual(matches[1].all, "1111")
        XCTAssertEqual(matches[2].all, "2222")
    }
    
    func test_matchAll() {
        guard let matches: [Match] = Regex("([0-9]+)-([0-9]+)-([0-9]+)")?.matches("090-1111-2222") else {
            XCTFail()
            return
        }
        XCTAssertEqual(matches.count, 1)
        
        let match = matches[0]
        XCTAssertEqual(match.groups.count, 4)
        XCTAssertEqual(match.groups[0], "090-1111-2222")
        XCTAssertEqual(match.groups[1], "090")
        XCTAssertEqual(match.groups[2], "1111")
        XCTAssertEqual(match.groups[3], "2222")
        XCTAssertEqual(match._0, "090-1111-2222")
        XCTAssertEqual(match._1, "090")
        XCTAssertEqual(match._2, "1111")
        XCTAssertEqual(match._3, "2222")
    }
}
