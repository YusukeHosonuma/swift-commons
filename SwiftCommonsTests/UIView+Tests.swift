//
//  UIView+Tests.swift
//  SwiftCommons
//
//  Created by Yusuke on 8/25/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import XCTest

class UIView_Tests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func test_coord() {
        
        let view = UIView(frame: CGRect(x: 10.0, y: 20.0, width: 40.0, height: 80.0))
        XCTAssertEqual( 10.0, view.x)
        XCTAssertEqual( 20.0, view.y)
        XCTAssertEqual( 40.0, view.width)
        XCTAssertEqual( 80.0, view.height)
        XCTAssertEqual( 50.0, view.right)
        XCTAssertEqual(100.0, view.bottom)
    }
    
    func test_move() {
        
        let view = UIView(frame: CGRect(x: 10.0, y: 20.0, width: 40.0, height: 80.0))
        
        // +=
        view += (5.0, 15.0)
        XCTAssertEqual(15.0, view.x)
        XCTAssertEqual(35.0, view.y)

        // -=
        view -= (5.0, 15.0)
        XCTAssertEqual(10.0, view.x)
        XCTAssertEqual(20.0, view.y)
    }
}
