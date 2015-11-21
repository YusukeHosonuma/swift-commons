//
//  SequenceType+.swift
//  SwiftCommons
//
//  Created by Yusuke on 11/21/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import Foundation

extension SequenceType where Generator.Element : Equatable {

    func group() -> [[Generator.Element]] {
        return self.groupBy{ $0 == $1 }
    }

    func groupBy(condition: (Generator.Element, Generator.Element) -> Bool) -> [[Generator.Element]] {
        var grouped: [[Generator.Element]] = []
        for x in self {
            if var lastGroup = grouped.last, let element = lastGroup.last where condition(element, x) {
                grouped.removeLast()
                lastGroup.append(x)
                grouped.append(lastGroup)
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
