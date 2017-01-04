//
//  SequenceType+.swift
//  SwiftCommons
//
//  Created by Yusuke on 11/21/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import Foundation

extension Sequence {
    
    /**
     ex)
     - [].replaceLast(4) -> [4]
     - [1, 2, 3].replaceLast(4) -> [1, 2, 4]
     */
    func replaceLast(_ replacement: Iterator.Element) -> [Iterator.Element] {
        var array = Array(self)
        if !array.isEmpty {
            array.removeLast()
        }
        array.append(replacement)
        return array
    }
}

extension Sequence where Iterator.Element : Equatable {

    /**
     Same by `groupBy(==)`
     
     ex)
     - [].group() -> []
     - [1, 1 ,1, 2, 3, 3].group() -> [[1, 1, 1], [2], [3, 3]]
     */
    func group() -> [[Iterator.Element]] {
        return self.groupBy(==)
    }

    /**
     ex)
     - [].groupBy(==) -> []
     - [1, 1 ,1, 2, 3, 3].group(==) -> [[1, 1, 1], [2], [3, 3]]
     - [1, 1 ,1, 2, 3, 3].group(!=) -> [[1], [1], [1, 2, 3], [3]]
     */
    func groupBy(_ condition: (Iterator.Element, Iterator.Element) -> Bool) -> [[Iterator.Element]] {
        var grouped: [[Iterator.Element]] = []
        for x in self {
            if var lastGroup = grouped.last, let element = lastGroup.last , condition(element, x) {
                lastGroup.append(x)
                grouped = grouped.replaceLast(lastGroup)
            } else {
                grouped.append([x])
            }
        }
        return grouped
    }
}

extension Sequence where Iterator.Element : Sequence {
    
    /**
     ex) [[1, 1, 1], [2], [3, 3]] -> [1, 1, 1, 2, 3, 3]
     */
    func concat() -> [Iterator.Element.Iterator.Element] {
        var concated: [Iterator.Element.Iterator.Element] = []
        for list in self {
            for x in list {
                concated.append(x)
            }
        }
        return concated
    }
}
