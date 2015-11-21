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
    
    func mask() -> String {
        let mask = Character("*")
        return String(count: self.length, repeatedValue: mask)
    }

    func mask(mask: String) -> String {
        return mask * self.length
    }
    
    func maskHead(count count: Int) -> String {
        return self.maskHead("*", count: count)
    }

    func maskHead(mask: String, count: Int) -> String {
        guard count < self.length else {
            return self.mask()
        }
        let mask = Character(mask)
        return String(count: count, repeatedValue: mask) + self[count..<self.length]
    }
    
    func maskTail(count count: Int) -> String {
        return self.maskTail("*", count: count)
    }
    
    func maskTail(mask: String, count: Int) -> String {
        guard count < self.length else {
            return self.mask()
        }
        let mask = Character(mask)
        return self[0..<(self.length - count)] + String(count: count, repeatedValue: mask)
    }
    
    func urlEncode() -> String {
        return stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.alphanumericCharacterSet())!
    }
    
    func urlDecode() -> String {
        return stringByRemovingPercentEncoding!
    }
    
    /**
    Converting Calendar Date String to NSDate
    
    - parameter format   : Calendar date format strings.
    - parameter calendar : calendar identifier.
    - parameter language : location identifier.
    - parameter timeZone : time zone.
    */
    func toDate(format format: String,
                     calendar: String = NSCalendarIdentifierGregorian,
                     language: String = "en",
                     timeZone: String = "GMT") -> NSDate? {
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
            
        //set calendar
        formatter.calendar = NSCalendar(calendarIdentifier: calendar)
        
        //set locale
        formatter.locale = NSLocale(localeIdentifier: language)
        
        //set timeZone
        formatter.timeZone = NSTimeZone(name: timeZone)
        
        return formatter.dateFromString(self)
    }

}