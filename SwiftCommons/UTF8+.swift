//
//  UTF8+.swift
//  SwiftCommons
//
//  Created by Kosuke Yoshimoto on 2017/02/11.
//  Copyright © 2017 Yusuke. All rights reserved.
//

extension UTF8 {
    
    /**
     Returns the number of code units(UInt8).
     
     - parameter leadingByte: The first byte of a code units.
     - raturns: The number of code units if a given value is valid, but otherwise nil.
     */
    static func width(leadingByte byte: UInt8) -> Int? {
        guard UTF8.isContinuation(byte) == false
            else { return nil }
        
        switch byte & 0xF0 {
        case 0xC0: return 2
        case 0xE0: return 3
        case 0xF0: return 4
        default: return 1
        }
    }
}
