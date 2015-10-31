//
//  ResourcesInitializable.swift
//  StoryboardTest
//
//  Created by Yusuke on 10/31/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import Foundation
import UIKit

protocol StoryboardInitializable {
}

protocol XibInitializable {
}

extension StoryboardInitializable where Self: UIViewController {
    
    static func instantiateStoryboard() -> Self {
        let bundle = NSBundle(forClass: self)
        return instantiateStoryboard(bundle: bundle)
    }
    
    static func instantiateStoryboard(bundle bundle: NSBundle?) -> Self {
        let type = Mirror(reflecting: self).subjectType
        let name = String(type).componentsSeparatedByString(".")[0]
        let storyboard = UIStoryboard(name: name, bundle: bundle)
        let viewController = storyboard.instantiateInitialViewController() as! Self
        return viewController
    }
}

extension XibInitializable where Self: UIView {
    
    static func instantiateXib() -> Self {
        let bundle = NSBundle(forClass: self)
        return instantiateXib(bundle: bundle)
    }
    
    static func instantiateXib(bundle bundle: NSBundle?) -> Self {
        let type = Mirror(reflecting: self).subjectType
        let name = String(type).componentsSeparatedByString(".")[0]
        let nib = UINib(nibName: name, bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! Self
        return view
    }
}
