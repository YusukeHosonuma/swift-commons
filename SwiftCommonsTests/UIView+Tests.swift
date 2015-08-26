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
        view += CGPoint(x: 5.0, y: 15.0)
        XCTAssertEqual(15.0, view.x)
        XCTAssertEqual(35.0, view.y)

        // -=
        view -= CGPoint(x: 5.0, y: 15.0)
        XCTAssertEqual(10.0, view.x)
        XCTAssertEqual(20.0, view.y)
    }
    
    func test_find() {
        
        // + 1
        //   + 11
        //   + 12
        //     + 121
        //     + 122
        let view1   = createView(tag: 1)

        let view11  = createView(tag: 11)
        let view12  = createView(tag: 12)
        view1.addSubview(view11)
        view1.addSubview(view12)
        
        let view121 = createView(tag: 121)
        let view122 = createView(tag: 122)
        view12.addSubview(view121)
        view12.addSubview(view122)
        
        var found: UIView?
        
        // find tag = 11
        found = view1.findView{ $0.tag == 11 }
        XCTAssertTrue(found === view11)
        
        // find tag = 12
        found = view1.findView{ $0.tag == 12 }
        XCTAssertTrue(found === view12)
        
        // find tag = 121
        found = view1.findView{ $0.tag == 121 }
        XCTAssertTrue(found === view121)
        
        // find tag = 122
        found = view1.findView{ $0.tag == 122 }
        XCTAssertTrue(found === view122)
    }
    
    // MARK: - Helper
    
    func createView(tag tag: Int) -> UIView {
        let view = UIView()
        view.tag = tag
        return view
    }
}
