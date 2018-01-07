//
//  Regex.swift
//  SwiftCommons
//
//  Created by Yusuke on 2017/01/14.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import Foundation

public protocol RegexMatcher {
    
    /// Is match string or not.
    ///
    /// - Parameter target: target string
    /// - Returns: true if any matches, otherwise false.
    func isMatch(_ target: String) -> Bool
    
    /// Return first match.
    ///
    /// - Parameter target: target string
    /// - Returns: `Match` if matched, otherwise nil.
    func match(_ target: String) -> Match?
    
    /// Return all matches.
    ///
    /// - Parameter target: target string
    /// - Returns: `Match` array if matched.
    func matches(_ target: String) -> [Match]
    
    /// Replace string.
    ///
    /// - Parameters:
    ///   - source: source string
    ///   - to: replacement string
    /// - Returns: replaced string.
    func replace(in source: String, to: String) -> String
}

public func regex() -> RegexPatternBuilder {
    return RegexPatternBuilder()
}

/// Create `Regex`, force unwarpped.
/// This is syntax sugar, convenience if pattern is statically string.
///
/// - Parameter pattern: pattern
/// - Returns: force unwapped `Regex`
public func regex(_ pattern: String) -> RegexBuilder {
    return RegexBuilder(pattern)
}


public struct RegexPatternBuilder {
    
    public func comment(_ _: String) -> RegexPatternBuilder {
        return self
    }
    
    public func pattern(_ pattern: String) -> RegexBuilder {
        return RegexBuilder(pattern)
    }
}

public struct RegexBuilder {
    
    fileprivate let pattern: String
    fileprivate var options: NSRegularExpression.Options = []
    
    fileprivate init(_ pattern: String) {
        self.pattern = pattern
    }
    
    public func build() -> Regex? {
        return Regex(self.pattern, options: self.options)
    }
    
    public func caseInsensitive() -> RegexBuilder {
        var builder = self
        builder.options.insert(.caseInsensitive)
        return builder
    }
    
    public func allowCommentsAndWhitespace() -> RegexBuilder {
        var builder = self
        builder.options.insert(.allowCommentsAndWhitespace)
        return builder
    }
    
    public func ignoreMetacharacters() -> RegexBuilder {
        var builder = self
        builder.options.insert(.ignoreMetacharacters)
        return builder
    }
    
    public func dotMatchesLineSeparators() -> RegexBuilder {
        var builder = self
        builder.options.insert(.dotMatchesLineSeparators)
        return builder
    }
    
    public func anchorsMatchLines() -> RegexBuilder {
        var builder = self
        builder.options.insert(.anchorsMatchLines)
        return builder
    }
    
    public func useUnixLineSeparators() -> RegexBuilder {
        var builder = self
        builder.options.insert(.useUnixLineSeparators)
        return builder
    }
    
    public func useUnicodeWordBoundaries() -> RegexBuilder {
        var builder = self
        builder.options.insert(.useUnicodeWordBoundaries)
        return builder
    }
}

extension RegexBuilder: RegexMatcher {
    
    private var regex: Regex {
        return Regex(self.pattern, options: self.options)!
    }
    
    public func isMatch(_ target: String) -> Bool {
        return self.regex.isMatch(target)
    }
    
    public func match(_ target: String) -> Match? {
        return self.regex.match(target)
    }
    
    public func matches(_ target: String) -> [Match] {
        return self.regex.matches(target)
    }
    
    public func replace(in source: String, to: String) -> String {
        return self.regex.replace(in: source, to: to)
    }
}

public struct Regex {
    
    fileprivate let regex: NSRegularExpression
    
    public init?(_ pattern: String, options: NSRegularExpression.Options = []) {
        do {
            self.regex = try NSRegularExpression(pattern: pattern, options: options)
        } catch {
            return nil
        }
    }
}

extension Regex: RegexMatcher {

    public func isMatch(_ target: String) -> Bool {
        return self.matches(target).count > 0
    }
    
    public func match(_ target: String) -> Match? {
        return self.matches(target).first
    }
    
    public func matches(_ target: String) -> [Match] {
        let range = NSRange(location: 0, length: target.count)
        return self.regex.matches(in: target, range: range).map {
            Match(target: target, result: $0)
        }
    }
    
    public func replace(in source: String, to: String) -> String {
        let range = NSRange(location: 0, length: source.count)
        return self.regex.stringByReplacingMatches(in: source, range: range, withTemplate: to)
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
        let ranges = (0..<self.result.numberOfRanges).map { self.result.range(at: $0) }
        return ranges.map {
            (self.target as NSString).substring(with: $0)
        }
    }
}
