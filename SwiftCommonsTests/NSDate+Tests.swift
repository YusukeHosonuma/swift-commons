//
//  NSDate+Tests.swift
//  SwiftCommons
//
//  Created by Yusuke on 9/10/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import XCTest
@testable import SwiftCommons
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


class NSDate_Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_operator() {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd hh:mm:ss"
        
        let d1 = formatter.date(from: "2016/03/01 00:00:00")
        let d2 = formatter.date(from: "2016/03/01 00:00:00")
        let d3 = formatter.date(from: "2016/03/02 00:00:00")
        
        XCTAssertTrue(d1 == d2)
        XCTAssertTrue(d1 != d3)
        
        XCTAssertTrue (d1 < d3)
        XCTAssertFalse(d1 < d2)
        
        XCTAssertTrue (d3 > d1)
        XCTAssertFalse(d2 > d1)
    }
    
    func test_fromRFC3339String() {

        var dc = DateComponents()
        dc.calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        dc.year   = 2015
        dc.month  = 09
        dc.day    = 10
        dc.hour   = 23
        dc.minute = 37
        dc.second = 05
        
        
        // GMT
        dc.timeZone = TimeZone(identifier: "GMT")
        let dateGmt = dc.date!
        
        // string -> date
        XCTAssertEqual(
            dateGmt,
            Date.fromRFC3339String("2015-09-10T23:37:05Z")!)
        
        // date -> string
        XCTAssertEqual(
            "2015-09-11T08:37:05+09:00",
            Date.toRFC3339String(dateGmt)!)
        
        
        // GMT+09:00(Asia)
        
        dc.timeZone = TimeZone(identifier: "Asia/Tokyo")
        let dateAsia = dc.date!
        
        // string -> date
        XCTAssertEqual(
            dateAsia,
            Date.fromRFC3339String("2015-09-10T23:37:05+09:00")!)
        
        // date -> string
        XCTAssertEqual(
            "2015-09-10T23:37:05+09:00",
            Date.toRFC3339String(dateAsia)!)
    }
    
    func test_unixtime() {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd hh:mm:ss"
        
        let date = formatter.date(from: "2015/11/22 01:33:00")
        XCTAssertEqual(date!.unixtime(), 1448123580.0)
    }
    
    func test_fromUnixtime() {
        
        let date = Date.fromUnixtime(1448123580.0)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd hh:mm:ss"
        XCTAssertEqual(formatter.string(from: date), "2015/11/22 01:33:00")
    }
}
