//
//  NSDate+Tests.swift
//  SwiftCommons
//
//  Created by Yusuke on 9/10/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import XCTest
@testable import SwiftCommons

class NSDate_Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_operator() {
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy/MM/dd hh:mm:ss"
        
        let d1 = formatter.dateFromString("2016/03/01 00:00:00")
        let d2 = formatter.dateFromString("2016/03/01 00:00:00")
        let d3 = formatter.dateFromString("2016/03/02 00:00:00")
        
        XCTAssertTrue(d1 == d2)
        XCTAssertTrue(d1 != d3)
        
        XCTAssertTrue (d1 < d3)
        XCTAssertFalse(d1 < d2)
        
        XCTAssertTrue (d3 > d1)
        XCTAssertFalse(d2 > d1)
    }
    
    func test_fromRFC3339String() {

        let dc = NSDateComponents()
        dc.calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        dc.year   = 2015
        dc.month  = 09
        dc.day    = 10
        dc.hour   = 23
        dc.minute = 37
        dc.second = 05
        
        
        // GMT
        
        dc.timeZone = NSTimeZone(name: "GMT")
        let dateGmt = dc.date!
        
        // string -> date
        XCTAssertEqual(
            dateGmt,
            NSDate.fromRFC3339String("2015-09-10T23:37:05Z")!)
        
        // date -> string
        XCTAssertEqual(
            "2015-09-11T08:37:05+09:00",
            NSDate.toRFC3339String(dateGmt)!)
        
        
        // GMT+09:00(Asia)
        
        dc.timeZone = NSTimeZone(name: "Asia/Tokyo")
        let dateAsia = dc.date!
        
        // string -> date
        XCTAssertEqual(
            dateAsia,
            NSDate.fromRFC3339String("2015-09-10T23:37:05+09:00")!)
        
        // date -> string
        XCTAssertEqual(
            "2015-09-10T23:37:05+09:00",
            NSDate.toRFC3339String(dateAsia)!)
    }
    
    func test_unixtime() {
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy/MM/dd hh:mm:ss"
        
        let date = formatter.dateFromString("2015/11/22 01:33:00")
        XCTAssertEqual(date!.unixtime(), 1448123580.0)
    }
    
    func test_fromUnixtime() {
        
        let date = NSDate.fromUnixtime(1448123580.0)
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy/MM/dd hh:mm:ss"
        XCTAssertEqual(formatter.stringFromDate(date), "2015/11/22 01:33:00")
    }
}
