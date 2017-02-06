//
//  MutableArray+.swift
//  SwiftCommons
//
//  Created by Yusuke on 11/28/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import Foundation

public extension Array {
    
    public mutating func insertHead(_ e: Element) {
        self.insert(e, at: 0)
    }
}
