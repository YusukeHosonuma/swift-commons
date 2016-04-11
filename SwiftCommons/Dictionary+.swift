//
//  Dictionary+.swift
//  SwiftCommons
//
//  Created by Yusuke on 4/12/16.
//  Copyright © 2016 Yusuke. All rights reserved.
//

import Foundation

extension Dictionary {
    
    static func create<T>(pairs: [(key: String, value: T?)]) -> [String:T] {
        
        var dict: [String:T] = [:]
        
        pairs.filter{ $0.value != nil }.forEach {
            dict[$0.key] = $0.value
        }
        
        return dict
    }
}
