//
//  NSDate+.swift
//  SwiftCommons
//
//  Created by Yusuke on 9/10/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import Foundation

extension NSDate {

    /// RFC3339 format for NSDate.
    private class var kRFC3339Format: String {
        return "yyyy'-'MM'-'dd'T'HH:mm:ssZZZZZ"
    }

    /**
    Convert date from RFC3339 string.
    
    - parameter string : The string to parse.
    - returns : A date.
    */
    class func fromRFC3339String(string: String) -> NSDate? {
        let formatter = NSDateFormatter()
        formatter.dateFormat = kRFC3339Format
        formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        formatter.timeZone = NSTimeZone.defaultTimeZone()
        return formatter.dateFromString(string)
    }
    
    /**
    Convert RFC3339 string from date.

    - parameter date : The date to string.
    - returns : RFC3339 string. (Timezone string is depends to defaultTimeZone)
    */
    class func toRFC3339String(date: NSDate) -> String? {
        let formatter = NSDateFormatter()
        formatter.dateFormat = kRFC3339Format
        formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        formatter.timeZone = NSTimeZone.defaultTimeZone()
        return formatter.stringFromDate(date)
    }
    
    func unixtime() -> NSTimeInterval {
        return self.timeIntervalSince1970
    }
    
    class func fromUnixtime(unixtime: NSTimeInterval) -> NSDate {
        return NSDate(timeIntervalSince1970: unixtime)
    }
}
