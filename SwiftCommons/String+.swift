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
        let range = Range<String.Index>(start: advance(self.startIndex, i), end: advance(self.startIndex, i + 1))
        return self.substringWithRange(range)
    }
    
    subscript(range: Range<Int>) -> String {
        let start = advance(self.startIndex, range.startIndex)
        let end   = advance(self.startIndex, range.endIndex)
        return self.substringWithRange(Range<Index>(start: start, end: end))
    }
}