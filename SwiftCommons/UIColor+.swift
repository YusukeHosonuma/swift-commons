//
//  UIColor+.swift
//  SwiftCommons
//
//  Created by Yusuke on 8/25/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    class func fromHex(hex: String) -> UIColor? {
        
        if hex.characters.count != 6 {
            return nil
        }
        
        let scanner = NSScanner(string: hex)
        var color: UInt32 = 0
        if (scanner.scanHexInt(&color)) {
            let r = (color & 0xFF0000) >> 16
            let g = (color & 0x00FF00) >> 8
            let b = (color & 0x0000FF)
            return UIColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: 1)
        }
        return nil
    }
}