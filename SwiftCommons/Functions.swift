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

/**
 Returns the sequence for sequentially getting values using an Array's subscript.
 
 This function is safe because it creates the sequence with `stride(_: to: by:)` function.
 ```
 let empty: [Int] = []
 let counter = counter(0, empty.endIndex-1) // not crash
 ```
 */
public func counter(_ from: Int = 0, to: Int) -> StrideTo<Int> {
    return stride(from: from, to: to, by: 1)
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
