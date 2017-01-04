//
//  UIColor+.swift
//  SwiftCommons
//
//  Created by Yusuke on 8/25/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {
    
    public class func fromHex(_ hex: String) -> UIColor? {
        
        if hex.characters.count != 6 {
            return nil
        }
        
        let scanner = Scanner(string: hex)
        var color: UInt32 = 0
        if (scanner.scanHexInt32(&color)) {
            let r = (color & 0xFF0000) >> 16
            let g = (color & 0x00FF00) >> 8
            let b = (color & 0x0000FF)
            return UIColor(red: CGFloat(r / 255), green: CGFloat(g / 255), blue: CGFloat(b / 255), alpha: 1)
        }
        return nil
    }
}
