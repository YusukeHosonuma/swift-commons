//
//  ResourcesInitializableTests.swift
//  SwiftCommons
//
//  Created by Yusuke on 11/1/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import XCTest
@testable import SwiftCommons

class ResourcesInitializableTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_instantiateStoryboard() {
        
        var viewController: UIViewController
        
        // use default bundle
        viewController = SampleViewController.instantiateStoryboard()
        XCTAssertNotNil(viewController)
        
        // use custom bundle
        let bundle = NSBundle(forClass: self.dynamicType)
        viewController = SampleViewController.instantiateStoryboard(bundle: bundle)
        XCTAssertNotNil(viewController)
    }
    
    func test_instantiateXib() {
        
        var view: UIView
        
        // use default bundle
        view = SampleView.instantiateXib()
        XCTAssertNotNil(view)
        
        // use custom bundle
        let bundle = NSBundle(forClass: self.dynamicType)
        view = SampleView.instantiateXib(bundle: bundle)
        XCTAssertNotNil(view)
    }
}
