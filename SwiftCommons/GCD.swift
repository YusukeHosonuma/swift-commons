//
//  GCD.swift
//  SwiftCommons
//
//  Created by Yusuke on 8/30/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import Foundation

enum GCDQueue {
    
    case main
    case high
    case `default`
    case low
    case background
    
    func dispatchQueue() -> DispatchQueue {
        switch self {
        case .main:
            return DispatchQueue.main
        case.high:
            return DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.high)
        case .default:
            return DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.default)
        case .low:
            return DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.low)
        case .background:
            return DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.background)
        }
    }
}

func dispatchAfter(delay: Double, closure: @escaping () -> ()) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC),
        execute: closure)
}

func dispatchAsync(_ queue: GCDQueue, closure: @escaping () -> ()) {
    queue.dispatchQueue().async(execute: closure)
}

func dispatchSync(_ queue: GCDQueue, closure: () -> ()) {
    queue.dispatchQueue().sync(execute: closure)
}
