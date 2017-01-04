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

        let bundle = Bundle(for: type(of: self))

        var viewController: UIViewController
        
        // by initial with default bundle
        viewController = SampleViewController.instantiateStoryboard()
        XCTAssertNotNil(viewController)
        
        // by initial with custom bundle
        viewController = SampleViewController.instantiateStoryboard(bundle: bundle)
        XCTAssertNotNil(viewController)
        
        // by identifier with default bundle
        viewController = SampleViewController.instantiateStoryboard(identifier: "SampleViewController2")
        XCTAssertNotNil(viewController)
        
        // by identifier with default bundle
        viewController = SampleViewController.instantiateStoryboard(bundle: bundle, identifier: "SampleViewController2")
        XCTAssertNotNil(viewController)
    }
    
    func test_instantiateXib() {
        
        var view: UIView
        
        // use default bundle
        view = SampleView.instantiateXib()
        XCTAssertNotNil(view)
        
        // use custom bundle
        let bundle = Bundle(for: type(of: self))
        view = SampleView.instantiateXib(bundle: bundle)
        XCTAssertNotNil(view)
    }
}
