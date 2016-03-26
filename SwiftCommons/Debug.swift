//
//  Debug.swift
//  SwiftCommons
//
//  Created by Yusuke on 11/22/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import Foundation

typealias D = Debug

class Debug {
    
    static var prefix = "🌟"

    static var debugPrefix = "[Debug]"
    static var infoPrefix  = "[Info]"
    static var warnPrefix  = "[Warn]"
    static var errorPrefix = "[Error]"
    
    private init() {}
    
    static func time(process: () -> ()) -> NSTimeInterval {
        let start = NSDate()
        process()
        return NSDate().timeIntervalSinceDate(start)
    }
    
    static func timePrint(label: String = "", process: () -> ()) {
            let t = String(format: "%.3f sec", time(process))
            if label.isEmpty {
                print("\(prefix)[Time] \(t)")
            } else {
                print("\(prefix)[Time] \(t) - \(label)")
            }
    }

    static func debug(string: String,
        line: Int = #line,
        file: String = #file,
        function: String = #function) {
            debugLog(string, levelPrefix: debugPrefix, line: line, file: file, function: function)
    }
    
    static func info(string: String,
        line: Int = #line,
        file: String = #file,
        function: String = #function) {
            debugLog(string, levelPrefix: infoPrefix, line: line, file: file, function: function)
    }
    
    static func warn(string: String,
        line: Int = #line,
        file: String = #file,
        function: String = #function) {
            debugLog(string, levelPrefix: warnPrefix, line: line, file: file, function: function)
    }
    
    static func error(string: String,
        line: Int = #line,
        file: String = #file,
        function: String = #function) {
            debugLog(string, levelPrefix: errorPrefix, line: line, file: file, function: function)
    }
    
    // MARK:- Shortcuts
    
    static func t(label: String = "", process: () -> ()) {
        timePrint(label, process: process)
    }
    
    static func d(string: String,
        line: Int = #line,
        file: String = #file,
        function: String = #function) {
            debug(string, line: line, file: file, function: function)
    }
    
    static func i(string: String,
        line: Int = #line,
        file: String = #file,
        function: String = #function) {
            info(string, line: line, file: file, function: function)
    }
    
    static func w(string: String,
        line: Int = #line,
        file: String = #file,
        function: String = #function) {
            warn(string, line: line, file: file, function: function)
    }
    
    static func e(string: String,
        line: Int = #line,
        file: String = #file,
        function: String = #function) {
            error(string, line: line, file: file, function: function)
    }
 
    // MARK:- Private
    
    private static func debugLog(string: String,
        levelPrefix: String,
        line: Int,
        file: String,
        function: String) {
            
            let filename = file.split("/").last ?? file
            print("\(prefix)\(levelPrefix) \(string) - L\(line) \(function) @ \(filename)")
    }
}