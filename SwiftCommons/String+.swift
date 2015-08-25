//
//  String+.swift
//  SwiftCommons
//
//  Created by Yusuke on 8/25/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import Foundation

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
    
    func length() -> Int { // Obj-C compatible
        let string: NSString = self
        return string.length
    }
}