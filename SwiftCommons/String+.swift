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
    Converting Calendar Date String to NSDate
    
    - parameter format : Calendar date format strings.
    - parameter cal    : calendar identifier. The default value depend on System Preference.
    - parameter loc    : location identifier. The default value depend on System Preference.
    - parameter tz     : time zone. The default value depend on System Preference.
    */
    func toDate(format format: String,
        cal: String? = nil,
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
    
    /**
    Converting Gregorian Calendar Date String to NSDate
    
    - parameter formatWST : Gregorian Calendar date format strings.
    - parameter loc       : location identifier. The default value depend on System Preference.
    - parameter tz        : time zone. The default value depend on System Preference.
    */
    func toDate(formatWST formatWST: String,
        loc: String? = nil,
        tz: String? = nil) -> NSDate? {
            
            return toDate(format: formatWST, cal: NSCalendarIdentifierGregorian, loc: loc, tz: tz);
    }
    
    /**
    Converting Japanese Calendar Date String to NSDate
    
    - parameter formatJP : Japanease Calendar date format strings.
    - parameter loc      : location identifier. The default value is ja_JP.
    - parameter tz       : time zone. The default value depend on System Preference.
    */
    func toDate(formatJP format: String,
        loc: String = "ja_JP",
        tz: String? = nil) -> NSDate? {
            
            return toDate(format: format, cal: NSCalendarIdentifierJapanese, loc: loc, tz: tz);
    }
}