//
//  Position.swift
//  Rectangles
//
//  Created by luca strazzullo on 18/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import Foundation

struct Position: Hashable {

    let xPercentage: Double
    let yPercentage: Double


    init(xPercentage: Double, yPercentage: Double) {
        self.xPercentage = xPercentage
        self.yPercentage = yPercentage
    }
}
