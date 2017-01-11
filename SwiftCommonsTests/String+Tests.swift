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
    
    // MARK: -
    // MARK: operator
    
    func test_repeat() {
        
        XCTAssertEqual("abc" * 1, "abc")
        XCTAssertEqual("abc" * 2, "abcabc")
        XCTAssertEqual("abc" * 3, "abcabcabc")
    }
    
    // MARK: -
    // MARK: subscript
    
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
    
    // MARK: -
    // MARK: property

    func test_length() {
        XCTAssertEqual("Hello".length, 5)
        XCTAssertEqual("あいうえお".length, 5)
        XCTAssertEqual("🍎🍊🍌🍇🍉".length, 5)
        XCTAssertEqual("\u{E9}".length, 1) // // é
        XCTAssertEqual("\u{65}\u{301}".length, 1) // e followed by ́
    }
    
    // MARK: -
    // MARK: method
    
    func test_with() {
        
        XCTAssertTrue("key".with("value") == ("key", "value"))
        XCTAssertTrue(("key" => "value") == ("key", "value"))
        
        let nilString: String? = nil
        
        let pair = "key".with(nilString)
        XCTAssertEqual(pair.0, "key")
        XCTAssertNil  (pair.1)
    }
    
    func test_map() {
        
        XCTAssertEqual(
            "Hello".map{ "[" + $0 + "]" }.joined(separator: ""),
            "[H][e][l][l][o]")

        XCTAssertEqual(
            "12345".map{ Int($0) ?? 0 }.reduce(0, +) , 15)
    }
    
    func test_filter() {
        
        XCTAssertEqual(
            "foo1baz2".filter{ Int($0) != nil },
            "12")
    }
    
    func test_reduce() {
        
        XCTAssertEqual(
            "Hello".reduce(""){ $0.tail(1) == $1 ? $0 : $0 + $1 },
            "Helo")
    }

    func test_equalsIgnoreCase() {
        
        XCTAssertTrue("hello".equalsIgnoreCase("HELLO"))
        XCTAssertFalse("ello".equalsIgnoreCase("HELLO"))

        XCTAssertTrue("hello" ==* "HELLO")
        XCTAssertFalse("ello" ==* "HELLO")
    }
    
    func test_match() {
        
        XCTAssertTrue("Hello World".match("^H.+d$"))
        XCTAssertFalse("Hello World.".match("^H.+d$"))
        
        XCTAssertTrue("Hello World" =~ "^H.+d$")
        XCTAssertFalse("Hello World." =~ "^H.+d$")
    }
    
    func test_head() {
        XCTAssertEqual("Hello".head(0), "")
        XCTAssertEqual("Hello".head(3), "Hel")
        XCTAssertEqual("Hello".head(6), "Hello") // over length
    }
    
    func test_tail() {
        XCTAssertEqual("Hello".tail(0), "")
        XCTAssertEqual("Hello".tail(3), "llo")
        XCTAssertEqual("Hello".tail(6), "Hello") // over length
    }
    
    func test_first() {
        XCTAssertEqual("Hello".first(), "H")
        XCTAssertEqual("".first(), "")
    }
    
    func test_last() {
        XCTAssertEqual("Hello".last(), "o")
        XCTAssertEqual("".last(), "")
    }
    
    func test_reverse() {
        XCTAssertEqual("Hello".reverse(), "olleH")
        XCTAssertEqual("".reverse(), "")
    }
    
    func test_remove() {
        XCTAssertEqual("Hello".remove("ell"), "Ho")
        XCTAssertEqual("Hello".remove("l"), "Heo")
    }
    
    func test_replace() {
        XCTAssertEqual("Hello".replace("ell", to: "ELL"), "HELLo")
        XCTAssertEqual("Hello".replace("l", to: "L"), "HeLLo")
    }
    
    func test_swapcase() {
        XCTAssertEqual("This is a Test".swapcase(), "tHIS IS A tEST")
        XCTAssertEqual("".swapcase(), "")
    }
    
    func test_trim() {
        XCTAssertEqual("hello".trim(), "hello")
        XCTAssertEqual(" hello ".trim(), "hello")
        XCTAssertEqual("  hello  ".trim(), "hello")
    }
    
    func test_trimn() {
        XCTAssertEqual("hello\n".trimn(), "hello")
        XCTAssertEqual("\n hello\n ".trimn(), "hello")
        XCTAssertEqual("  \nhello  \n".trimn(), "hello")
    }
    
    func test_split() {
        XCTAssertEqual(
            ["apple", "banana", "orange"],
            "apple-banana-orange".split("-"))
    }
    
    func test_mask() {
        XCTAssertEqual("password".mask(), "********")
        XCTAssertEqual("password".mask("$"), "$$$$$$$$")
    }
    
    func test_maskHead() {
        XCTAssertEqual("".maskHead(count: 0), "")
        XCTAssertEqual("password".maskHead(count: 0),  "password")
        XCTAssertEqual("password".maskHead(count: 5),  "*****ord")
        XCTAssertEqual("password".maskHead(count: 10), "********")
        XCTAssertEqual("password".maskHead("-", count: 4),  "----word")
    }
    
    func test_maskTail() {
        XCTAssertEqual("".maskTail(count: 0), "")
        XCTAssertEqual("password".maskTail(count: 0),  "password")
        XCTAssertEqual("password".maskTail(count: 5),  "pas*****")
        XCTAssertEqual("password".maskTail(count: 10), "********")
        XCTAssertEqual("password".maskTail("-", count: 4),  "pass----")
    }
    
    func test_urlEncode_urlDecode() {
        
        let string = "http://hogehoge.com/?param=!*'();:@&=+$,/?%#[]"
        
        let encodedString = string.urlEncode()
        XCTAssertEqual("http%3A%2F%2Fhogehoge%2Ecom%2F%3Fparam%3D%21%2A%27%28%29%3B%3A%40%26%3D%2B%24%2C%2F%3F%25%23%5B%5D", encodedString)
        
        let decodedString = encodedString.urlDecode()
        XCTAssertEqual(string, decodedString)
    }
    
    func test_isDigit() {
        XCTAssertTrue ("0123456789".isDigitOnly())
        XCTAssertFalse("0123456789x".isDigitOnly())
        XCTAssertFalse("abcdefghijk".isDigitOnly())
    }
    
    func test_toDate() {
        
        func date(y:Int, M:Int, d:Int, h:Int = 0, m:Int = 0, s:Int = 0, tz:String? = "GMT") -> Date? {
            var dateComp = DateComponents()
            dateComp.calendar = Calendar(identifier: Calendar.Identifier.gregorian)
            dateComp.year = y
            dateComp.month = M
            dateComp.day = d
            dateComp.hour = h
            dateComp.minute = m
            dateComp.second = s
            if let _ = tz {
                dateComp.timeZone = TimeZone(identifier: tz!)
            }
            
            return dateComp.date
        }
        
        func assertTest(_ d1: Date?, _ d2: Date?) {
            guard let date1 = d1, let date2 = d2 else {
                XCTFail()
                return
            }
            XCTAssertEqual(date1, date2)
        }
        
        /* Case 1 */
        assertTest("2015/9/15 22:30:30".toDate(format: "yyyy/M/dd H:mm:ss"),
            date(y: 2015, M: 9, d: 15, h:22, m:30, s:30))
        
        /* Case 2
         * timeZone of format has more priority than timeZone property.
         */
        assertTest("2015/9/15 22:30:30 Japan".toDate(format: "yyyy/M/dd H:mm:ss VV"),
            date(y: 2015, M: 9, d: 15, h:22, m:30, s:30, tz:"Japan"))
        assertTest("2015/9/15 22:30:30 GMT+9:00".toDate(format: "yyyy/M/dd H:mm:ss ZZZZ"),
            date(y: 2015, M: 9, d: 15, h:22, m:30, s:30, tz:"JST"))
        assertTest("2015/9/15 22:30:30 America/Los_Angeles".toDate(format: "yyyy/M/dd H:mm:ss VV"),
            date(y: 2015, M: 9, d: 15, h:22, m:30, s:30, tz:"America/Los_Angeles"))
    
        /* Case 3
         * Japanaese Calendar 
         */
        assertTest("平成27年 9月15日 22時30分30秒".toDate(format: "GGGyy年 M月dd日 H時mm分ss秒", calendar: Calendar.Identifier.japanese, language:"ja"),
            date(y: 2015, M: 9, d: 15, h:22, m:30, s:30))
        assertTest("H27年 9月15日 22時30分30秒".toDate(format: "GGGGGyy年 M月dd日 H時mm分ss秒", calendar: Calendar.Identifier.japanese),
            date(y: 2015, M: 9, d: 15, h:22, m:30, s:30))
        assertTest("H27 9/15 22:30:30 Japan".toDate(format: "GGGGGyy M/dd H:mm:ss VV", calendar: Calendar.Identifier.japanese),
            date(y: 2015, M: 9, d: 15, h:22, m:30, s:30, tz:"JST"))

    }
}
