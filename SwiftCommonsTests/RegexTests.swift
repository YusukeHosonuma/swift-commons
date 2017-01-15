//
//  RegexTests.swift
//  SwiftCommons
//
//  Created by Yusuke on 2017/01/14.
//  Copyright © 2017 Yusuke. All rights reserved.
//

import XCTest
import Foundation
@testable import SwiftCommons

class RegexTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_builderExpression() {
        
        // Use build(), this is need manually unwrap.
        let regexZipCode = regex()
            .comment("zipcode")
            .pattern("#japan [0-9]{3}-[0-9]{4}")
            .allowCommentsAndWhitespace()
            .build()
        XCTAssertEqual(regexZipCode?.isMatch("123-4567"), true)
        
        // Not use build(), fail if pattern was invalid.
        XCTAssertTrue(regex()
            .pattern("#example Hello,\\s.+$")
            .caseInsensitive()
            .allowCommentsAndWhitespace()
            .isMatch("HELLO, world!"))
    }
    
    func test_invalidPattern() {
        XCTAssertNil(Regex(""))
    }
    
    func test_isMatch() {
        
        // regular
        XCTAssertTrue (Regex("[0-9]+")!.isMatch("090-1111-2222"))
        XCTAssertFalse(Regex("[A-Z]+")!.isMatch("090-1111-2222"))

        // use options
        XCTAssertFalse(Regex("HELLO")!.isMatch("hello, world"))
        XCTAssertTrue (Regex("HELLO", options: [.caseInsensitive])!.isMatch("hello, world"))
        
        // syntax sugar (Don't need unwrap. Convenience if pattern is statically string)
        XCTAssertTrue(regex("[0-9]+").isMatch("090-1111-2222"))
    }
    
    func test_matches() {
        guard let matches: [Match] = Regex("[0-9]+")?.matches("090-1111-2222") else {
            XCTFail()
            return
        }
        XCTAssertEqual(matches.count, 3)
        XCTAssertEqual(matches[0].all, "090")
        XCTAssertEqual(matches[1].all, "1111")
        XCTAssertEqual(matches[2].all, "2222")
    }
    
    func test_match() {
        guard let match = Regex("([0-9]+)-([0-9]+)-([0-9]+)")!.match("090-1111-2222") else {
            XCTFail()
            return
        }
        XCTAssertEqual(match.all, "090-1111-2222")
        XCTAssertEqual(match.groups[1], "090")
        XCTAssertEqual(match.groups[2], "1111")
        XCTAssertEqual(match.groups[3], "2222")
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
    
    func test_replace() {
        XCTAssertEqual(Regex("[0-9]+")!.replace(in: "090-1111-2222", to: "xxx"), "xxx-xxx-xxx")
    }
}
