//
//  UIView+.swift
//  SwiftCommons
//
//  Created by Yusuke on 8/25/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import Foundation
import UIKit

func += (left: UIView, right: (x: CGFloat, y: CGFloat)) {
    left.frame.origin.x += right.x
    left.frame.origin.y += right.y
}

func -= (left: UIView, right: (x: CGFloat, y: CGFloat)) {
    left.frame.origin.x -= right.x
    left.frame.origin.y -= right.y
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
}
