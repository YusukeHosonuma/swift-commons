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


public func ..< <T>(leftBound: T, rightBound: T) -> StrideTo<T> {
    return stride(from: leftBound, to: rightBound, by: 1)
}

public func ... <T>(leftBound: T, rightBound: T) -> StrideThrough<T> {
    return stride(from: leftBound, through: rightBound, by: 1)
}

/**
 Returns the sequence for sequentially getting values using an Array's subscript.
 
 This function is safe because it creates the sequence with `stride(_: to: by:)` function.
 
 */
public func counter<T>(_ range: StrideTo<T>) -> StrideTo<T> {
    return range
}

/**
 Returns the sequence for sequentially getting values using an Array's subscript.
 
 This function is safe because it creates the sequence with `stride(_: through: by:)` function.
 
 */
public func counter<T>(_ range: StrideThrough<T>) -> StrideThrough<T> {
    return range
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
