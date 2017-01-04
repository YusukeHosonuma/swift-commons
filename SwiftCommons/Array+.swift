//
//  Array+.swift
//  SwiftCommons
//
//  Created by Yusuke on 8/24/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import Foundation

public extension Array {
    
    public subscript(orNil index: Int) -> Element? {
        return (index < 0 || count <= index) ? nil : self[index]
    }
    
    public func inits() -> Array {
        return Array(self[0..<(count - 1)])
    }
    
    public func tail() -> Array {
        return (count <= 1) ? [] : Array(self[1..<count])
    }
    
    public func take(_ n: Int) -> Array {
        return Array(self[0..<Swift.min(n, count)])
    }
    
    public func drop(_ n: Int) -> Array {
        if n == 0 {
            return self
        } else {
            return Array(self[n..<count])
        }
    }

    public func forEach(_ f: (Element) -> ()) {
        for n: Element in self {
            f(n)
        }
    }

    /// Alias for reduce, like Haskell.
    public func foldl<T>(_ acc: T, f: (_ a: T, _ b: Element) -> T) -> T {
        return reduce(acc, f)
    }
    
    /// foldr from Haskell.
    public func foldr<T>(_ acc: T, f: (_ a: T, _ b: Element) -> T) -> T {
        return reversed().reduce(acc, f)
    }
    
    /// foldl1 from Haskell.
    public func foldl1(_ f: (_ a: Element, _ b: Element) -> Element) -> Element {
        var x = first!
        for e in tail() {
            x = f(x, e)
        }
        return x
    }
    
    /// foldr1 from Haskell.
    public func foldr1(_ f: (_ a: Element, _ b: Element) -> Element) -> Element {
        return reversed().foldl1(f)
    }
}
