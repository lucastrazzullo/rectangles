//
//  CacheBackedPosition.swift
//  Rectangles
//
//  Created by luca strazzullo on 19/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import Foundation

struct CacheBackedPosition: Position, Codable {

    let xPercentage: Double
    let yPercentage: Double

    init(xPercentage: Double, yPercentage: Double) {
        self.xPercentage = xPercentage
        self.yPercentage = yPercentage
    }

    init(_ position: Position) {
        self.xPercentage = position.xPercentage
        self.yPercentage = position.yPercentage
    }
}
