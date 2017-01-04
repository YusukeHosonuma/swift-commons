//
//  Functions.swift
//  SwiftCommons
//
//  Created by Yusuke on 8/25/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import Foundation

func isEven(_ x: Int) -> Bool {
    return x % 2 == 0
}

func isOdd(_ x: Int) -> Bool {
    return !isEven(x)
}

func ngt(_ x: Int) -> Int {
    return -x
}

func screenSize() -> CGSize {
    return UIScreen.main.bounds.size
}

func screenWidth() -> CGFloat {
    return screenSize().width
}

func screenHeight() -> CGFloat {
    return screenSize().height
}
