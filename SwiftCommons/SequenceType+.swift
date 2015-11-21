//
//  SequenceType+.swift
//  SwiftCommons
//
//  Created by Yusuke on 11/21/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import Foundation

extension SequenceType where Generator.Element : Equatable {
    
    typealias E = Generator.Element

    func group() -> [[E]] {
        return self.groupBy{ $0 == $1 }
    }

    func groupBy(condition: (E, E) -> Bool) -> [[E]] {
        var grouped: [[E]] = []
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
