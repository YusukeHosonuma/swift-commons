//
//  UIView+.swift
//  SwiftCommons
//
//  Created by Yusuke on 8/25/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import Foundation
import UIKit


// MARK: UIView operators

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


// MARK: UIView extensions

extension UIView {
    
    
    // MARK: Properties
    
    var x: CGFloat {
        return position.x
    }
    
    var y: CGFloat {
        return position.y
    }
    
    var width: CGFloat {
        return size.width
    }
    
    var height: CGFloat {
        return size.height
    }
    
    var right: CGFloat {
        return x + width
    }
    
    var bottom: CGFloat {
        return y + height
    }
    
    var position: CGPoint {
        return frame.origin
    }
    
    var size: CGSize {
        return bounds.size
    }
    
    
    // MARK: Public methods
    
    /// Hide and return self.
    func hide() -> UIView {
        hidden = true
        return self
    }
    
    /// Show and return self.
    func show() -> UIView {
        hidden = false
        return self
    }
    
    func findView(@noescape matchView: (view: UIView) -> Bool) -> UIView? {
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
    
    func findViews(@noescape f: (view: UIView) -> Bool) -> [UIView] {
        var founds = [UIView]()
        for view in subviews {
            if f(view: view) {
                founds.append(view)
            }
            founds += view.findViews(f)
        }
        return founds
    }
    
    func applyAllSubviews(@noescape f: (view: UIView) -> ()) {
        for view in subviews {
            f(view: view)
            view.applyAllSubviews(f)
        }
    }
    
    func applyAllViews(@noescape f: (view: UIView) -> ()) {
        f(view: self)
        applyAllSubviews(f)
    }
}
