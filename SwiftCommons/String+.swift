//
//  String+.swift
//  SwiftCommons
//
//  Created by Yusuke on 8/25/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import Foundation

infix operator ==* // short cut for equalsIgnoreCase()
infix operator =~ // short cut for match()
infix operator => // short cut for with()

public func ==* (left: String, right: String) -> Bool {
    return left.equalsIgnoreCase(right)
}

public func =~ (left: String, right: String) -> Bool {
    return left.match(right)
}

public func => <T>(left: String, right: T) -> (String, T) {
    return left.with(right)
}

public func * (left: String, right: Int) -> String {
    return (1...right).map { _ -> String in left }.joined(separator: "")
}


// subscript
public extension String {
    
    public subscript(i: Int) -> String {
        let start = index(startIndex, offsetBy: i)
        let end   = index(startIndex, offsetBy: i + 1)
        return String(self[start..<end])
    }
    
    public subscript(range: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end   = index(startIndex, offsetBy: range.upperBound)
        return String(self[start..<end])
    }
}

// function
public extension String {
    
    public func with<T>(_ value: T) -> (String, T) {
        return (self, value)
    }
    
    public func equalsIgnoreCase(_ string: String) -> Bool {
        let s1 = self.lowercased()
        let s2 = string.lowercased()
        return s1 == s2
    }
    
    public func match(_ pattern: String) -> Bool {
        guard let matches = Regex(pattern)?.matches(self) else { return false }
        return matches.count > 0
    }
    
    public func head(_ count: Int) -> String {
        return (count > self.count) ? self : self[0..<count]
    }
    
    public func tail(_ count: Int) -> String {
        if (count > self.count) {
            return self
        } else {
            let from = self.count - count
            let to   = from + count
            return self[from..<to]
        }
    }
    
    public func first() -> String {
        return head(1)
    }
    
    public func last() -> String {
        return tail(1)
    }
    
    public func remove(_ string: String) -> String {
        return self.replacingOccurrences(of: string, with: "")
    }
    
    public func replace(_ string: String, to: String) -> String {
        return self.replacingOccurrences(of: string, with: to)
    }
    
    public func swapcase() -> String {
        let result = self.map { (c: Character) -> Character in
            let s = String(c)
            let l = s.lowercased()
            let u = s.uppercased()
            return (s == l) ? u.first! : l.first!
        }
        return String(result)
    }
    
    /**
    Trim white space chars.
    
    - returns: Trimed string.
     */
    public func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    /**
    Trim white space and new line chars.
    
    - returns: Trimed string.
    */
    public func trimn() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    /**
    Split string.
    
    - parameter separator: separator string
    - returns: [String]
    */
    public func split(_ separator: String) -> [String] {
        return components(separatedBy: separator)
    }
    
    public func mask() -> String {
        let mask = Character("*")
        return String(repeating: String(mask), count: self.count)
    }

    public func mask(_ mask: String) -> String {
        return mask * self.count
    }
    
    public func maskHead(count: Int) -> String {
        return self.maskHead("*", count: count)
    }

    public func maskHead(_ mask: String, count: Int) -> String {
        guard count < self.count else {
            return self.mask()
        }
        let mask = Character(mask)
        return String(repeating: String(mask), count: count) + self[count..<self.count]
    }
    
    public func maskTail(count: Int) -> String {
        return self.maskTail("*", count: count)
    }
    
    public func maskTail(_ mask: String, count: Int) -> String {
        guard count < self.count else {
            return self.mask()
        }
        let mask = Character(mask)
        return self[0..<(self.count - count)] + String(repeating: String(mask), count: count)
    }
    
    public func urlEncode() -> String {
        return addingPercentEncoding(withAllowedCharacters: CharacterSet.alphanumerics)!
    }
    
    public func urlDecode() -> String {
        return self.removingPercentEncoding!
    }
    
    func isDigitOnly() -> Bool {
        return self.all { $0.isDigit }
    }
    
    /**
    Converting Calendar Date String to NSDate
    
    - parameter format   : Calendar date format strings.
    - parameter calendar : calendar identifier.
    - parameter language : location identifier.
    - parameter timeZone : time zone.
    */
    public func toDate(format: String,
                calendar: Calendar.Identifier = Calendar.Identifier.gregorian,
                language: String = "en",
                timeZone: String = "GMT") -> Date? {
        
        let formatter = DateFormatter()
        formatter.dateFormat = format
            
        //set calendar
        formatter.calendar = Calendar(identifier: calendar)
        
        //set locale
        formatter.locale = Locale(identifier: language)
        
        //set timeZone
        formatter.timeZone = TimeZone(identifier: timeZone)
        
        return formatter.date(from: self)
    }

}
