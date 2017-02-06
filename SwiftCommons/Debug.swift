//
//  Debug.swift
//  SwiftCommons
//
//  Created by Yusuke on 11/22/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import Foundation

public typealias D = Debug

public class Debug {
    
    public static var prefix = "🌟"

    private static var debugPrefix = "[Debug]"
    private static var infoPrefix  = "[Info]"
    private static var warnPrefix  = "[Warn]"
    private static var errorPrefix = "[Error]"
    
    fileprivate init() {}
    
    public static func time(_ process: () -> ()) -> TimeInterval {
        let start = Date()
        process()
        return Date().timeIntervalSince(start)
    }
    
    public static func timePrint(_ label: String = "", process: () -> ()) {
            let t = String(format: "%.3f sec", time(process))
            if label.isEmpty {
                print("\(prefix)[Time] \(t)")
            } else {
                print("\(prefix)[Time] \(t) - \(label)")
            }
    }

    public static func debug(_ string: String,
        line: Int = #line,
        file: String = #file,
        function: String = #function) {
            debugLog(string, levelPrefix: debugPrefix, line: line, file: file, function: function)
    }
    
    public static func info(_ string: String,
        line: Int = #line,
        file: String = #file,
        function: String = #function) {
            debugLog(string, levelPrefix: infoPrefix, line: line, file: file, function: function)
    }
    
    public static func warn(_ string: String,
        line: Int = #line,
        file: String = #file,
        function: String = #function) {
            debugLog(string, levelPrefix: warnPrefix, line: line, file: file, function: function)
    }
    
    public static func error(_ string: String,
        line: Int = #line,
        file: String = #file,
        function: String = #function) {
            debugLog(string, levelPrefix: errorPrefix, line: line, file: file, function: function)
    }
    
    // MARK:- Shortcuts
    
    public static func t(_ label: String = "", process: () -> ()) {
        timePrint(label, process: process)
    }
    
    public static func d(_ string: String,
        line: Int = #line,
        file: String = #file,
        function: String = #function) {
            debug(string, line: line, file: file, function: function)
    }
    
    public static func i(_ string: String,
        line: Int = #line,
        file: String = #file,
        function: String = #function) {
            info(string, line: line, file: file, function: function)
    }
    
    public static func w(_ string: String,
        line: Int = #line,
        file: String = #file,
        function: String = #function) {
            warn(string, line: line, file: file, function: function)
    }
    
    public static func e(_ string: String,
        line: Int = #line,
        file: String = #file,
        function: String = #function) {
            error(string, line: line, file: file, function: function)
    }
 
    // MARK:- Private
    
    fileprivate static func debugLog(_ string: String,
        levelPrefix: String,
        line: Int,
        file: String,
        function: String) {
            
            let filename = file.split("/").last ?? file
            print("\(prefix)\(levelPrefix) \(string) - L\(line) \(function) @ \(filename)")
    }
}
