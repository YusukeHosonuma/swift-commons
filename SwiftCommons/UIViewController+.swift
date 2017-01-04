//
//  UIViewController+.swift
//  SwiftCommons
//
//  Created by Yusuke on 8/28/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

extension UIViewController {

    public func exclusiveTouches() {
        self.view.applyAllViews { $0.isExclusiveTouch = true }
    }
}
