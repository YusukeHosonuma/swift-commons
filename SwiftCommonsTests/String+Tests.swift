//
//  String+Tests.swift
//  SwiftCommons
//
//  Created by Yusuke on 8/25/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import XCTest
@testable import SwiftCommons

class String_Tests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_repeat() {
        
        XCTAssertEqual("abc" * 1, "abc")
        XCTAssertEqual("abc" * 2, "abcabc")
        XCTAssertEqual("abc" * 3, "abcabcabc")
    }
    
    func test_subscript_index() {

        XCTAssertEqual("Hello"[0], "H")
        XCTAssertEqual("Hello"[1], "e")
        XCTAssertEqual("Hello"[2], "l")
        XCTAssertEqual("Hello"[3], "l")
        XCTAssertEqual("Hello"[4], "o")
    }
    
    func test_subscript_range() {

        // from head
        XCTAssertEqual("Hello"[0..<1], "H")
        XCTAssertEqual("Hello"[0..<2], "He")
        XCTAssertEqual("Hello"[0..<3], "Hel")
        XCTAssertEqual("Hello"[0..<4], "Hell")
        XCTAssertEqual("Hello"[0..<5], "Hello")

        // from tail
        XCTAssertEqual("Hello"[4..<5], "o")
        XCTAssertEqual("Hello"[3..<5], "lo")
        XCTAssertEqual("Hello"[2..<5], "llo")
        XCTAssertEqual("Hello"[1..<5], "ello")
        XCTAssertEqual("Hello"[0..<5], "Hello")
    }
    
    func test_length() {
        XCTAssertEqual("Hello".length, 5)
        XCTAssertEqual("あいうえお".length, 5)
        XCTAssertEqual("🍎🍊🍌🍇🍉".length, 5)
        XCTAssertEqual("\u{E9}".length, 1) // // é
        XCTAssertEqual("\u{65}\u{301}".length, 1) // e followed by ́
    }
    
    func test_urlEncode_urlDecode() {
        
        let string = "http://hogehoge.com/?param=!*'();:@&=+$,/?%#[]"
        
        let encodedString = string.urlEncode()
        XCTAssertEqual("http%3A%2F%2Fhogehoge%2Ecom%2F%3Fparam%3D%21%2A%27%28%29%3B%3A%40%26%3D%2B%24%2C%2F%3F%25%23%5B%5D", encodedString)
        
        let decodedString = encodedString.urlDecode()
        XCTAssertEqual(string, decodedString)
    }
    
    func test_toDate() {
        
        let string = "2015/09/01 01:43:02"
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy/MM/dd hh:mm:ss"
        let expect = formatter.dateFromString(string)

        // success
        XCTAssertEqual(expect!, string.toDate(format: "yyyy/MM/dd HH:mm:ss")!)
        
        // fail (missing :ss)
        XCTAssertNil(string.toDate(format: "yyyy/MM/dd HH:mm"))
    }
}
