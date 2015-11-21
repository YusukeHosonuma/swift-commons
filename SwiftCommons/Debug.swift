//
//  Debug.swift
//  SwiftCommons
//
//  Created by Yusuke on 11/22/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import Foundation

class Debug {
    
    private init() {}
    
    static func time(process: () -> ()) -> NSTimeInterval {
        let start = NSDate()
        process()
        return NSDate().timeIntervalSinceDate(start)
    }
    
    static func timePrint(label: String, process: () -> ()) {
        let t = time(process)
        print("\(label) \(t)")
    }
}