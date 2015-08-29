//
//  GCD.swift
//  SwiftCommons
//
//  Created by Yusuke on 8/30/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import Foundation

enum GCDQueue {
    
    case Main
    case High
    case Default
    case Low
    case Background
    
    func dispatchQueue() -> dispatch_queue_t {
        switch self {
        case .Main:
            return dispatch_get_main_queue()
        case.High:
            return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)
        case .Default:
            return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        case .Low:
            return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)
        case .Background:
            return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)
        }
    }
}

func dispatchAfter(delay delay: Double, closure: () -> ()) {
    dispatch_after(
        dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC))),
        dispatch_get_main_queue(),
        closure)
}

func dispatchAsync(queue: GCDQueue, closure: () -> ()) {
    dispatch_async(
        queue.dispatchQueue(),
        closure)
}

func dispatchSync(queue: GCDQueue, closure: () -> ()) {
    dispatch_sync(
        queue.dispatchQueue(),
        closure)
}
