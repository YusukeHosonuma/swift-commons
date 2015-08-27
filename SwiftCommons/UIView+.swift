//
//  UIView+.swift
//  SwiftCommons
//
//  Created by Yusuke on 8/25/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import Foundation
import UIKit

func += (left: UIView, right: CGPoint) {
    left.frame.origin.x += right.x
    left.frame.origin.y += right.y
}

func -= (left: UIView, right: CGPoint) {
    left.frame.origin.x -= right.x
    left.frame.origin.y -= right.y
}

func += (left: UIView, right: CGSize) {
    left.frame.size.width  += right.width
    left.frame.size.height += right.height
}

func -= (left: UIView, right: CGSize) {
    left.frame.size.width  -= right.width
    left.frame.size.height -= right.height
}

extension UIView {
    
    var x: CGFloat {
        return self.frame.origin.x
    }
    
    var y: CGFloat {
        return self.frame.origin.y
    }
    
    var width: CGFloat {
        return self.frame.size.width
    }
    
    var height: CGFloat {
        return self.frame.size.height
    }
    
    var right: CGFloat {
        return x + width
    }
    
    var bottom: CGFloat {
        return y + height
    }
    
    func findView(matchView: (view: UIView) -> Bool) -> UIView? {
        for view in subviews {
            if matchView(view: view) {
                return view
            }
            if let found = view.findView(matchView) {
                return found
            }
        }
        return nil
    }
    
    func findViews(f: (view: UIView) -> Bool) -> [UIView] {
        var founds = [UIView]()
        for view in subviews {
            if f(view: view) {
                founds.append(view)
            }
            founds += view.findViews(f)
        }
        return founds
    }
    
    func applyAllSubviews(f: (view: UIView) -> ()) {
        for view in subviews {
            f(view: view)
            view.applyAllSubviews(f)
        }
    }
    
    func applyAllViews(f: (view: UIView) -> ()) {
        f(view: self)
        applyAllSubviews(f)
    }
}
