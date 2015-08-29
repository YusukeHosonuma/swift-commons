//
//  UIView+Tests.swift
//  SwiftCommons
//
//  Created by Yusuke on 8/25/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import XCTest
@testable import SwiftCommons

class UIView_Tests: XCTestCase {

    // + 1
    //   + 11
    //   + 12
    //     + 121
    //     + 122
    var view1: UIView!
    var view11: UIView!
    var view12: UIView!
    var view121: UIView!
    var view122: UIView!
    
    override func setUp() {
        super.setUp()
        
        view1 = createView(tag: 1)
        
        view11  = createView(tag: 11)
        view12  = createView(tag: 12)
        view1.addSubview(view11)
        view1.addSubview(view12)
        
        view121 = createView(tag: 121)
        view122 = createView(tag: 122)
        view12.addSubview(view121)
        view12.addSubview(view122)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func test_coords() {
        
        let view = UIView(frame: CGRect(x: 10.0, y: 20.0, width: 40.0, height: 80.0))
        
        // coords
        XCTAssertEqual( 10.0, view.x)
        XCTAssertEqual( 20.0, view.y)
        XCTAssertEqual( 40.0, view.width)
        XCTAssertEqual( 80.0, view.height)
        XCTAssertEqual( 50.0, view.right)
        XCTAssertEqual(100.0, view.bottom)
        
        // position / size
        XCTAssertEqual(CGPoint(x: 10.0, y: 20.0), view.position)
        XCTAssertEqual(CGSize(width: 40.0, height: 80.0), view.size)
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
    
    func test_resize() {
        
        let view = UIView(frame: CGRect(x: 10.0, y: 20.0, width: 40.0, height: 80.0))
        
        // +=
        view += CGSize(width: 5.0, height: 15.0)
        XCTAssertEqual(45.0, view.width)
        XCTAssertEqual(95.0, view.height)
        
        // -=
        view -= CGSize(width: 5.0, height: 15.0)
        XCTAssertEqual(40.0, view.width)
        XCTAssertEqual(80.0, view.height)
    }
    
    func test_hide() {
        
        let view1 = UIView()
        view1.hidden = false
        
        let view2 = view1.hide()
        XCTAssertTrue(view1 === view2)
        XCTAssertTrue(view1.hidden)
    }
    
    func test_show() {
        
        let view1 = UIView()
        view1.hidden = true
        
        let view2 = view1.show()
        XCTAssertTrue(view1 === view2)
        XCTAssertFalse(view1.hidden)
    }
    
    func test_findView() {

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
    
    func test_findViews() {

        var founds: [UIView]
        
        // find odd tag
        founds = view1.findViews { isOdd($0.tag) }
        XCTAssertEqual(2, founds.count)
        XCTAssertTrue(founds[orNil: 0] == view11)
        XCTAssertTrue(founds[orNil: 1] == view121)
        
        // find even tag
        founds = view1.findViews { isEven($0.tag) }
        XCTAssertEqual(2, founds.count)
        XCTAssertTrue(founds[orNil: 0] == view12)
        XCTAssertTrue(founds[orNil: 1] == view122)
    }
    
    func test_applyAllSubviews() {

        view1.applyAllSubviews { (view: UIView) -> () in view.tag = 3 }
        XCTAssertEqual(1, view1.tag)
        XCTAssertEqual(3, view11.tag)
        XCTAssertEqual(3, view12.tag)
        XCTAssertEqual(3, view121.tag)
        XCTAssertEqual(3, view122.tag)
    }
    
    func test_applyAllViews() {
        
        view1.applyAllViews { (view: UIView) -> () in view.tag = 3 }
        XCTAssertEqual(3, view1.tag)
        XCTAssertEqual(3, view11.tag)
        XCTAssertEqual(3, view12.tag)
        XCTAssertEqual(3, view121.tag)
        XCTAssertEqual(3, view122.tag)
    }
}
