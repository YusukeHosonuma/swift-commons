//
//  Collection+.swift
//  SwiftCommons
//
//  Created by Kosuke Yoshimoto on 2017/02/12.
//  Copyright © 2017 Yusuke. All rights reserved.
//

public extension Collection where Iterator.Element: Equatable, IndexDistance == Int {
    
    /**
     Searchs a Collection for a specified value and calls a given handler when matched.
     This provides for String.CharacterView and String.UTF16View.
     
     - parameters:
       - value: A collection to search for.
       - matched: A closure that takes an first index where the specified value matched and returns Boolean value that indicates whether it continues searching.
     */
    public func search<C: Collection>(forContentsOf value: C, matched: (Index) -> Bool) where C.Iterator.Element == Iterator.Element, C.IndexDistance == IndexDistance {
        
        next: for i in 0..<(self.count - (value.count - 1)) {
            for j in 0..<value.count {
                let n = self[self.index(self.startIndex, offsetBy: (i+j))]
                let s = value[value.index(value.startIndex, offsetBy: j)]
                if n != s {
                    break
                } else if j == value.count - 1 {
                    let index = self.index(self.startIndex, offsetBy: i)
                    guard matched(index) else {
                        break next
                    }
                }
            }
        }
    }
    
    /// Command failed due to signal: Segmentation fault: 11
    /*
    public func search<T: Equatable>(forContentsOf value: T) -> Iterator.Element? where T == Iterator.Element  {
        
        for content in self {
            if content == value {
                return content
            }
        }
        return nil
    }
    */
}


