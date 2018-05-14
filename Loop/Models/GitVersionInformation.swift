//
//  GitVersionInformation.swift
//  Loop2
//
//  Copyright © 2018 LoopKit Authors. All rights reserved.
//

import Foundation

struct GitVersionInformation {
    let dict : [String:String]
}

extension GitVersionInformation {
    init() {
        var myDict: [String: String]?
        if let path = Bundle.main.path(forResource: "GitInfo", ofType: "plist") {
            myDict = NSDictionary(contentsOfFile: path) as? [String: String]
        }
        if let d = myDict {
            dict = d
        } else {
            dict = [:]
        }
    }
}
