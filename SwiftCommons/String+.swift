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
    
    func urlEncode() -> String {
        return stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.alphanumericCharacterSet())!
    }
    
    func urlDecode() -> String {
        return stringByRemovingPercentEncoding!
    }
    
    func toDate(format format: String) -> NSDate? {
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        return formatter.dateFromString(self)
    }
}