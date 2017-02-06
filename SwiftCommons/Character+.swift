//
//  Character+.swift
//  SwiftCommons
//
//  Created by Yusuke on 2017/01/11.
//  Copyright © 2017 Yusuke. All rights reserved.
//

import Foundation

public extension Character {
    var isDigit: Bool {
        return self == "0"
            || self == "1"
            || self == "2"
            || self == "3"
            || self == "4"
            || self == "5"
            || self == "6"
            || self == "7"
            || self == "8"
            || self == "9"
    }
}
