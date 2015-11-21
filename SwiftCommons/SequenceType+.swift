//
//  SequenceType+.swift
//  SwiftCommons
//
//  Created by Yusuke on 11/21/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import Foundation

extension SequenceType {
    
    /**
     ex)
     - [].replaceLast(4) -> [4]
     - [1, 2, 3].replaceLast(4) -> [1, 2, 4]
     */
    func replaceLast(replacement: Generator.Element) -> [Generator.Element] {
        var array = Array(self)
        if !array.isEmpty {
            array.removeLast()
        }
        array.append(replacement)
        return array
    }
}

extension SequenceType where Generator.Element : Equatable {

    /**
     Same by `groupBy(==)`
     
     ex)
     - [].group() -> []
     - [1, 1 ,1, 2, 3, 3].group() -> [[1, 1, 1], [2], [3, 3]]
     */
    func group() -> [[Generator.Element]] {
        return self.groupBy(==)
    }

    /**
     ex)
     - [].groupBy(==) -> []
     - [1, 1 ,1, 2, 3, 3].group(==) -> [[1, 1, 1], [2], [3, 3]]
     - [1, 1 ,1, 2, 3, 3].group(!=) -> [[1], [1], [1, 2, 3], [3]]
     */
    func groupBy(condition: (Generator.Element, Generator.Element) -> Bool) -> [[Generator.Element]] {
        var grouped: [[Generator.Element]] = []
        for x in self {
            if var lastGroup = grouped.last, let element = lastGroup.last where condition(element, x) {
                lastGroup.append(x)
                grouped = grouped.replaceLast(lastGroup)
            } else {
                grouped.append([x])
            }
        }
        return grouped
    }
}

extension SequenceType where Generator.Element : SequenceType {
    
    /**
     ex) [[1, 1, 1], [2], [3, 3]] -> [1, 1, 1, 2, 3, 3]
     */
    func concat() -> [Generator.Element.Generator.Element] {
        var concated: [Generator.Element.Generator.Element] = []
        for list in self {
            for x in list {
                concated.append(x)
            }
        }
        return concated
    }
}
