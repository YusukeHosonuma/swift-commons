//
//  Collection+Tests.swift
//  SwiftCommons
//
//  Created by Kosuke Yoshimoto on 2017/02/12.
//  Copyright © 2017 Yusuke. All rights reserved.
//

import XCTest
@testable import SwiftCommons

class Collection_Tests: XCTestCase {
    func test_CharacterView_search() {
        let str = "\"PPAP\", \"✑\", \"🍍\", \"🍎\", \"✒\", \"PPAP\""
        var machCount: Int = 0
        str.characters.search(forContentsOf: "PPAP".characters) { location in
           
            XCTAssertEqual(str[location..<str.index(location, offsetBy: 4)], "PPAP")
            machCount += 1
            return true
        }
        XCTAssertEqual(machCount, 2)
    }
    
    func test_UTF16View_search() {
        let str = "\"PPAP\", \"✑\", \"🍍\", \"🍎\", \"✒\", \"PPAP\""
        var machCount: Int = 0
        str.utf16.search(forContentsOf: "PPAP".utf16) { location in
            let index = location.samePosition(in: str)
            XCTAssertNotNil(index)
            XCTAssertEqual(str[index!..<str.index(index!, offsetBy: 4)], "PPAP")
            machCount += 1
            return true
        }
        XCTAssertEqual(machCount, 2)
    }
    
    let testBundle = Bundle(path: URL(fileURLWithPath: #file).deletingLastPathComponent().appendingPathComponent("Resources").path)!
    
    func filePath(name: String) -> String {
        return testBundle.path(forResource: name, ofType: nil)!
    }
    
    func test_measure_characters_search() {
        let content = try! String(contentsOfFile: filePath(name: "emoji_list.txt"))
        self.measure {
            content.characters.search(forContentsOf: "".characters) { _ in return true }
        }
    }
    
    func test_measure_utf16_search() {
        let content = try! String(contentsOfFile: filePath(name: "emoji_list.txt"))
        self.measure {
            content.utf16.search(forContentsOf: "".utf16) { _ in return true }
        }
    }
}
