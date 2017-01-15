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
    
    func test_basic() {
        
        // Use build(), this is need manually unwrap.
        guard let regexZipCode = regex()
            .comment("Japanese postal code")
            .pattern("zip:([0-9]{3})[-]([0-9]{4})")
            .caseInsensitive()
            .build() else {
                XCTFail("Invalid pattern")
                return
        }
        
        let target = "zip:123-4567, ZIP:888-9999"
        
        // isMatch() -> Bool
        XCTAssertEqual(regexZipCode.isMatch(target), true)
        
        // match() -> Match?
        XCTAssertEqual(regexZipCode.match(target)?._0, "zip:123-4567")
        XCTAssertEqual(regexZipCode.match(target)?._1, "123")
        XCTAssertEqual(regexZipCode.match(target)?._2, "4567")
        
        // matches() -> [Match]
        XCTAssertEqual(regexZipCode.matches(target).count, 2)
        XCTAssertEqual(regexZipCode.matches(target)[0].groups.count, 3)
        XCTAssertEqual(regexZipCode.matches(target)[0]._0, "zip:123-4567")
        XCTAssertEqual(regexZipCode.matches(target)[0]._1, "123")
        XCTAssertEqual(regexZipCode.matches(target)[0]._2, "4567")
        XCTAssertEqual(regexZipCode.matches(target)[1].groups.count, 3)
        XCTAssertEqual(regexZipCode.matches(target)[1]._0, "ZIP:888-9999")
        XCTAssertEqual(regexZipCode.matches(target)[1]._1, "888")
        XCTAssertEqual(regexZipCode.matches(target)[1]._2, "9999")
        
        // replace() -> String
        XCTAssertEqual(regexZipCode.replace(in: target, to: "****"), "****, ****")
    }
    
    func test_notUseBuild() {

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
