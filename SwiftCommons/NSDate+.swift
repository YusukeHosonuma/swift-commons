//
//  NSDate+.swift
//  SwiftCommons
//
//  Created by Yusuke on 9/10/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import Foundation

public func < (lhs: Date, rhs: Date) -> Bool {
    return lhs.compare(rhs) == .orderedAscending
}

extension Date {

    /// RFC3339 format for NSDate.
    fileprivate static var kRFC3339Format: String {
        return "yyyy'-'MM'-'dd'T'HH:mm:ssZZZZZ"
    }

    /**
    Convert date from RFC3339 string.
    
    - parameter string : The string to parse.
    - returns : A date.
    */
    static func fromRFC3339String(_ string: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = kRFC3339Format
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone.current
        return formatter.date(from: string)
    }
    
    /**
    Convert RFC3339 string from date.

    - parameter date : The date to string.
    - returns : RFC3339 string. (Timezone string is depends to defaultTimeZone)
    */
    static func toRFC3339String(_ date: Date) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = kRFC3339Format
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone.current
        return formatter.string(from: date)
    }
    
    func unixtime() -> TimeInterval {
        return self.timeIntervalSince1970
    }
    
    static func fromUnixtime(_ unixtime: TimeInterval) -> Date {
        return Date(timeIntervalSince1970: unixtime)
    }
}
