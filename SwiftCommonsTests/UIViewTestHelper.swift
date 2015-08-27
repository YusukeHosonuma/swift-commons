//
//  UIViewTestHelper.swift
//  SwiftCommons
//
//  Created by Yusuke on 8/28/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import Foundation
import UIKit

func createView(tag tag: Int) -> UIView {
    let view = UIView()
    view.tag = tag
    return view
}
