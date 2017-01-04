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
        let range = characters.index(startIndex, offsetBy: i)..<characters.index(startIndex, offsetBy: i + 1)
        return substring(with: range)
    }
    
    public subscript(range: Range<Int>) -> String {
        let start = characters.index(startIndex, offsetBy: range.lowerBound)
        let end   = characters.index(startIndex, offsetBy: range.upperBound)
        return substring(with: start..<end)
    }
}

// property
public extension String {
    
    public var length: Int {
        return characters.count
    }
}

// function
public extension String {
    
    public func with<T>(_ value: T) -> (String, T) {
        return (self, value)
    }
    
    public func map<T>(_ f: (String) -> T) -> [T] {
        return self.characters.map { (c: Character) -> T in
            let s = String(c)
            return f(s)
        }
    }
    
    public func filter(_ f: (String) -> Bool) -> String {
        let result = self.characters.filter { (c: Character) -> Bool in
            let s = String(c)
            return f(s)
        }
        return String(result)
    }
    
    public func reduce<T>(_ initial: T, f: (T, String) -> T) -> T {
        let result = self.characters.reduce(initial) { (r: T, c: Character) -> T in
            let s = String(c)
            return f(r, s)
        }
        return result
    }
    
    public func equalsIgnoreCase(_ string: String) -> Bool {
        let s1 = self.lowercased()
        let s2 = string.lowercased()
        return s1 == s2
    }
    
    public func match(_ pattern: String) -> Bool {
        do {
            let regexp = try NSRegularExpression(pattern: pattern, options: [])
            let matches = regexp.matches(in: self, options: [], range: NSMakeRange(0, length))
            return matches.count > 0
        } catch {
            return false
        }
    }
    
    public func head(_ length: Int) -> String {
        return (length > self.length) ? self : self[0..<length]
    }
    
    public func tail(_ length: Int) -> String {
        if (length > self.length) {
            return self
        } else {
            let from = self.length - length
            let to   = from + length
            return self[from..<to]
        }
    }
    
    public func first() -> String {
        return head(1)
    }
    
    public func last() -> String {
        return tail(1)
    }
    
    public func reverse() -> String {
        return String(self.characters.reversed())
    }
    
    public func remove(_ string: String) -> String {
        return self.replacingOccurrences(of: string, with: "")
    }
    
    public func replace(_ string: String, to: String) -> String {
        return self.replacingOccurrences(of: string, with: to)
    }
    
    public func swapcase() -> String {
        let result = self.characters.map { (c: Character) -> Character in
            let s = String(c)
            let l = s.lowercased()
            let u = s.uppercased()
            return (s == l) ? u.characters.first! : l.characters.first!
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
        return String(repeating: String(mask), count: self.length)
    }

    public func mask(_ mask: String) -> String {
        return mask * self.length
    }
    
    public func maskHead(count: Int) -> String {
        return self.maskHead("*", count: count)
    }

    public func maskHead(_ mask: String, count: Int) -> String {
        guard count < self.length else {
            return self.mask()
        }
        let mask = Character(mask)
        return String(repeating: String(mask), count: count) + self[count..<self.length]
    }
    
    public func maskTail(count: Int) -> String {
        return self.maskTail("*", count: count)
    }
    
    public func maskTail(_ mask: String, count: Int) -> String {
        guard count < self.length else {
            return self.mask()
        }
        let mask = Character(mask)
        return self[0..<(self.length - count)] + String(repeating: String(mask), count: count)
    }
    
    public func urlEncode() -> String {
        return addingPercentEncoding(withAllowedCharacters: CharacterSet.alphanumerics)!
    }
    
    public func urlDecode() -> String {
        return self.removingPercentEncoding!
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
