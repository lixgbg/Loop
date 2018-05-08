//
//  AnalyticsManager.swift
//  Naterade
//
//  Created by Nathan Racklyeft on 4/28/16.
//  Copyright © 2016 Nathan Racklyeft. All rights reserved.
//

import Foundation


final class StatisticsManager: IdentifiableClass {
    
    var stats : [String:Int]
    var lastLog : Date
    var start : Date
    init() {
        stats = [:]
        start = Date()
        lastLog = Date()
    }
    
    static let shared = StatisticsManager()
    
    public var loopManager : LoopDataManager? = nil
    
    private func str() -> String {
        return "Stats since \(start): \(stats)"
    }
    
    public func inc(_ name: String) {
        // This should use a queue.
        if let i = stats[name] {
            stats[name] = i + 1
        } else {
            stats[name] = 1
        }
        NSLog(str())
        if lastLog.timeIntervalSinceNow < TimeInterval(hours: -1) {
            if let loop = self.loopManager {
                loop.addInternalNote(str())
                lastLog = Date()
                stats = [:]
            }
        }
    }
}
