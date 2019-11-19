//
//  AnyPosition.swift
//  Rectangles
//
//  Created by luca strazzullo on 19/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import Foundation

struct AnyPosition: Position, Hashable {

    let xPercentage: Double
    let yPercentage: Double

    init(_ position: Position) {
        xPercentage = position.xPercentage
        yPercentage = position.yPercentage
    }

    init(xPercentage: Double, yPercentage: Double) {
        self.xPercentage = xPercentage
        self.yPercentage = yPercentage
    }
}
