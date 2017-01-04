//
//  Functions.swift
//  SwiftCommons
//
//  Created by Yusuke on 8/25/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import Foundation

public func isEven(_ x: Int) -> Bool {
    return x % 2 == 0
}

public func isOdd(_ x: Int) -> Bool {
    return !isEven(x)
}

public func ngt(_ x: Int) -> Int {
    return -x
}

public func screenSize() -> CGSize {
    return UIScreen.main.bounds.size
}

public func screenWidth() -> CGFloat {
    return screenSize().width
}

public func screenHeight() -> CGFloat {
    return screenSize().height
}
