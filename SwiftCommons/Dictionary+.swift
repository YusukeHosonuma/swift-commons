//
//  Dictionary+.swift
//  SwiftCommons
//
//  Created by Yusuke on 4/12/16.
//  Copyright © 2016 Yusuke. All rights reserved.
//

import Foundation

public extension Dictionary {
    
    public static func create<T>(_ pairs: [(key: String, value: T?)]) -> [String:T] {
        
        var dict: [String:T] = [:]
        
        pairs.filter{ $0.value != nil }.forEach {
            dict[$0.key] = $0.value
        }
        
        return dict
    }
}
