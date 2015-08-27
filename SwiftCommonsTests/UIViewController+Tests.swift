//
//  UIViewController+Tests.swift
//  SwiftCommons
//
//  Created by Yusuke on 8/27/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import XCTest
@testable import SwiftCommons

class UIViewController_Tests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func test_exclusiveTouches() {
        
        let viewController = UIViewController()

        // + 1
        //   + 11
        //   + 12
        //     + 121
        //     + 122
        let view1   = createView(tag: 1)
        viewController.view.addSubview(view1)
        
        let view11  = createView(tag: 11)
        let view12  = createView(tag: 12)
        view1.addSubview(view11)
        view1.addSubview(view12)
        
        let view121 = createView(tag: 121)
        let view122 = createView(tag: 122)
        view12.addSubview(view121)
        view12.addSubview(view122)

        viewController.exclusiveTouches()
        
        XCTAssertTrue(view1.exclusiveTouch)
        XCTAssertTrue(view11.exclusiveTouch)
        XCTAssertTrue(view12.exclusiveTouch)
        XCTAssertTrue(view121.exclusiveTouch)
        XCTAssertTrue(view122.exclusiveTouch)
    }
}
