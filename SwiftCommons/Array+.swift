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
    
    func take(_ n: Int) -> Array {
        return Array(self[0..<Swift.min(n, count)])
    }
    
    func drop(_ n: Int) -> Array {
        if n == 0 {
            return self
        } else {
            return Array(self[n..<count])
        }
    }

    func forEach(_ f: (Element) -> ()) {
        for n: Element in self {
            f(n)
        }
    }

    /// Alias for reduce, like Haskell.
    func foldl<T>(_ acc: T, f: (_ a: T, _ b: Element) -> T) -> T {
        return reduce(acc, f)
    }
    
    /// foldr from Haskell.
    func foldr<T>(_ acc: T, f: (_ a: T, _ b: Element) -> T) -> T {
        return reversed().reduce(acc, f)
    }
    
    /// foldl1 from Haskell.
    func foldl1(_ f: (_ a: Element, _ b: Element) -> Element) -> Element {
        var x = first!
        for e in tail() {
            x = f(x, e)
        }
        return x
    }
    
    /// foldr1 from Haskell.
    func foldr1(_ f: (_ a: Element, _ b: Element) -> Element) -> Element {
        return reversed().foldl1(f)
    }
}
