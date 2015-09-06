//
//  String+.swift
//  SwiftCommons
//
//  Created by Yusuke on 8/25/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import Foundation

func * (left: String, right: Int) -> String {
    return (1...right).map { _ -> String in left }.joinWithSeparator("")
}

extension String {
    
    subscript(i: Int) -> String {
        let range = Range<String.Index>(start: startIndex.advancedBy(i), end: startIndex.advancedBy(i + 1))
        return substringWithRange(range)
    }
    
    subscript(range: Range<Int>) -> String {
        let start = startIndex.advancedBy(range.startIndex)
        let end   = startIndex.advancedBy(range.endIndex)
        return substringWithRange(Range<Index>(start: start, end: end))
    }
    
    var length: Int {
        return characters.count
    }

    /**
    Trim white space chars.
    
    - returns: Trimed string.
     */
    func trim() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }
    
    /**
    Trim white space and new line chars.
    
    - returns: Trimed string.
    */
    func trimn() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
    
    /**
    Split string.
    
    - parameter separator: separator string
    - returns: [String]
    */
    func split(separator: String) -> [String] {
        return componentsSeparatedByString(separator)
    }
    
    func urlEncode() -> String {
        return stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.alphanumericCharacterSet())!
    }
    
    func urlDecode() -> String {
        return stringByRemovingPercentEncoding!
    }
    
    /**
    Converting String to NSDate
    
    - parameter format: date format strings
    - parameter ca    : calendar identifier. default is gregorian.
    - parameter loc   : location identifier. default is specified by setting app.
    - parameter tz    : time zone. default is specified by setting app.
    */
    func toDate(format format: String,
                          cal: String? = NSCalendarIdentifierGregorian,
                          loc: String? = nil,
                           tz: String? = nil) -> NSDate? {
            
            let formatter = NSDateFormatter()
            formatter.dateFormat = format
           
            //set calendar
            if let _ = cal {
                formatter.calendar = NSCalendar(calendarIdentifier: cal!)
            }
                            
            //set locale
            if let _ = loc {
                formatter.locale = NSLocale(localeIdentifier: loc!)
            }
            
            //set timeZone
            if let _ = tz {
                formatter.timeZone = NSTimeZone(name: tz!)
            }
            
            return formatter.dateFromString(self)
    }
}