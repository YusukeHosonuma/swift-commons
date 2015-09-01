//
//  Array+.swift
//  SwiftCommons
//
//  Created by Yusuke on 8/24/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import Foundation

extension Array {
    
    subscript(orNil index: Int) -> Element? {
        return (index < 0 || count <= index) ? nil : self[index]
    }
    
    func inits() -> Array {
        return Array(self[0..<(count - 1)])
    }
    
    func tail() -> Array {
        return (count <= 1) ? [] : Array(self[1..<count])
    }
    
    func take(n: Int) -> Array {
        return Array(self[0..<min(n, count)])
    }
    
    func drop(n: Int) -> Array {
        if n == 0 {
            return self
        } else {
            return Array(self[n..<count])
        }
    }

    func forEach(@noescape f: Element -> ()) {
        for n: Element in self {
            f(n)
        }
    }
    
    func reduce1(@noescape f: (a: Element, b: Element) -> Element) -> Element {
        var x = first!
        for e in tail() {
            x = f(a: x, b: e)
        }
        return x
    }
}
