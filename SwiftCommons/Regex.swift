//
//  Regex.swift
//  SwiftCommons
//
//  Created by Yusuke on 2017/01/14.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import Foundation

public struct Regex {
    
    private let regex: NSRegularExpression
    
    public init?(_ pattern: String) {
        do {
            self.regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        } catch {
            return nil
        }
    }
    
    public func matches(_ target: String) -> [Match] {
        let range = NSRange(location: 0, length: target.characters.count)
        return self.regex.matches(in: target, range: range).map {
            Match(target: target, result: $0)
        }
    }
}

public struct Match {
    
    private let target: String
    private let result: NSTextCheckingResult
    
    fileprivate init(target: String, result: NSTextCheckingResult) {
        self.target = target
        self.result = result
    }
    
    public var all: String {
        return self.groups.first!
    }
    
    public var _0: String { return self.groups[0] }
    public var _1: String { return self.groups[1] }
    public var _2: String { return self.groups[2] }
    public var _3: String { return self.groups[3] }
    
    public var groups: [String] {
        let ranges = (0..<self.result.numberOfRanges).map { self.result.rangeAt($0) }
        return ranges.map {
            (self.target as NSString).substring(with: $0)
        }
    }
}
