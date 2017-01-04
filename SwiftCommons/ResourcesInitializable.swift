//
//  ResourcesInitializable.swift
//  StoryboardTest
//
//  Created by Yusuke on 10/31/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import Foundation
import UIKit

public protocol StoryboardInitializable {
}

public protocol XibInitializable {
}

public extension StoryboardInitializable where Self: UIViewController {
    
    public static func instantiateStoryboard() -> Self {
        let bundle = Bundle(for: self)
        return instantiateStoryboard(bundle: bundle)
    }
    
    public static func instantiateStoryboard(bundle: Bundle?) -> Self {
        let type = Mirror(reflecting: self).subjectType
        let name = String(describing: type).components(separatedBy: ".")[0]
        let storyboard = UIStoryboard(name: name, bundle: bundle)
        let viewController = storyboard.instantiateInitialViewController() as! Self
        return viewController
    }
    
    public static func instantiateStoryboard(identifier: String) -> Self {
        let bundle = Bundle(for: self)
        return instantiateStoryboard(bundle: bundle, identifier: identifier)
    }
    
    public static func instantiateStoryboard(bundle: Bundle?, identifier: String) -> Self {
        let type = Mirror(reflecting: self).subjectType
        let name = String(describing: type).components(separatedBy: ".")[0]
        let storyboard = UIStoryboard(name: name, bundle: bundle)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as! Self
        return viewController
    }
}

public extension XibInitializable where Self: UIView {
    
    public static func instantiateXib() -> Self {
        let bundle = Bundle(for: self)
        return instantiateXib(bundle: bundle)
    }
    
    public static func instantiateXib(bundle: Bundle?) -> Self {
        let type = Mirror(reflecting: self).subjectType
        let name = String(describing: type).components(separatedBy: ".")[0]
        let nib = UINib(nibName: name, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! Self
        return view
    }
}
