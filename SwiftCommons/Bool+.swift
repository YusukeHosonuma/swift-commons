//
//  Bool+.swift
//  SwiftCommons
//
//  Created by Yusuke on 3/21/16.
//  Copyright © 2016 Yusuke. All rights reserved.
//

import Foundation

public extension Bool {
    
    public func stringValue() -> String {
        return self ? "true" : "false"
    }
}
