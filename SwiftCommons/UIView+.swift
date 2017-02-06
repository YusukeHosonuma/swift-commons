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

public func += (left: UIView, right: CGPoint) {
    left.frame.origin.x += right.x
    left.frame.origin.y += right.y
}

public func -= (left: UIView, right: CGPoint) {
    left.frame.origin.x -= right.x
    left.frame.origin.y -= right.y
}

public func += (left: UIView, right: CGSize) {
    left.frame.size.width  += right.width
    left.frame.size.height += right.height
}

public func -= (left: UIView, right: CGSize) {
    left.frame.size.width  -= right.width
    left.frame.size.height -= right.height
}


// MARK: UIView extensions

public extension UIView {
    
    // MARK: Properties
    
    public var x: CGFloat {
        return position.x
    }
    
    public var y: CGFloat {
        return position.y
    }
    
    public var width: CGFloat {
        return size.width
    }
    
    public var height: CGFloat {
        return size.height
    }
    
    public var right: CGFloat {
        return x + width
    }
    
    public var bottom: CGFloat {
        return y + height
    }
    
    public var position: CGPoint {
        return frame.origin
    }
    
    public var size: CGSize {
        return bounds.size
    }
    
    
    // MARK: Public methods
    
    /// Hide and return self.
    public func hide() -> UIView {
        isHidden = true
        return self
    }
    
    /// Show and return self.
    public func show() -> UIView {
        isHidden = false
        return self
    }
    
    public func findView(_ matchView: (_ view: UIView) -> Bool) -> UIView? {
        for view in subviews {
            if matchView(view) {
                return view
            }
            if let found = view.findView(matchView) {
                return found
            }
        }
        return nil
    }
    
    public func findViews(_ f: (_ view: UIView) -> Bool) -> [UIView] {
        var founds = [UIView]()
        for view in subviews {
            if f(view) {
                founds.append(view)
            }
            founds += view.findViews(f)
        }
        return founds
    }
    
    public func applyAllSubviews(_ f: (_ view: UIView) -> ()) {
        for view in subviews {
            f(view)
            view.applyAllSubviews(f)
        }
    }
    
    public func applyAllViews(_ f: (_ view: UIView) -> ()) {
        f(self)
        applyAllSubviews(f)
    }
}
