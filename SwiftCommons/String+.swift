//
//  String+.swift
//  SwiftCommons
//
//  Created by Yusuke on 8/25/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import Foundation

infix operator ==* {} // short cut for equalsIgnoreCase()
infix operator =~ {}  // short cut for match()

func ==* (left: String, right: String) -> Bool {
    return left.equalsIgnoreCase(right)
}

func =~ (left: String, right: String) -> Bool {
    return left.match(right)
}

func * (left: String, right: Int) -> String {
    return (1...right).map { _ -> String in left }.joinWithSeparator("")
}

extension String {
    
    subscript(i: Int) -> String {
        let range = startIndex.advancedBy(i)..<startIndex.advancedBy(i + 1)
        return substringWithRange(range)
    }
    
    subscript(range: Range<Int>) -> String {
        let start = startIndex.advancedBy(range.startIndex)
        let end   = startIndex.advancedBy(range.endIndex)
        return substringWithRange(start..<end)
    }
    
    var length: Int {
        return characters.count
    }
    
    func map<T>(f: String -> T) -> [T] {
        return self.characters.map { (c: Character) -> T in
            let s = String(c)
            return f(s)
        }
    }
    
    func filter(f: String -> Bool) -> String {
        let result = self.characters.filter { (c: Character) -> Bool in
            let s = String(c)
            return f(s)
        }
        return String(result)
    }
    
    func reduce<T>(initial: T, f: (T, String) -> T) -> T {
        let result = self.characters.reduce(initial) { (r: T, c: Character) -> T in
            let s = String(c)
            return f(r, s)
        }
        return result
    }
    
    func equalsIgnoreCase(string: String) -> Bool {
        let s1 = self.lowercaseString
        let s2 = string.lowercaseString
        return s1 == s2
    }
    
    func match(pattern: String) -> Bool {
        do {
            let regexp = try NSRegularExpression(pattern: pattern, options: [])
            let matches = regexp.matchesInString(self, options: [], range: NSMakeRange(0, length))
            return matches.count > 0
        } catch {
            return false
        }
    }
    
    func head(length: Int) -> String {
        return (length > self.length) ? self : self[0..<length]
    }
    
    func tail(length: Int) -> String {
        if (length > self.length) {
            return self
        } else {
            let from = self.length - length
            let to   = from + length
            return self[from..<to]
        }
    }
    
    func first() -> String {
        return head(1)
    }
    
    func last() -> String {
        return tail(1)
    }
    
    func reverse() -> String {
        return String(self.characters.reverse())
    }
    
    func remove(string: String) -> String {
        return self.stringByReplacingOccurrencesOfString(string, withString: "")
    }
    
    func replace(string: String, to: String) -> String {
        return self.stringByReplacingOccurrencesOfString(string, withString: to)
    }
    
    func swapcase() -> String {
        let result = self.characters.map { (c: Character) -> Character in
            let s = String(c)
            let l = s.lowercaseString
            let u = s.uppercaseString
            return (s == l) ? u.characters.first! : l.characters.first!
        }
        return String(result)
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