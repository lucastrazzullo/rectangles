//
//  Size.swift
//  Rectangles
//
//  Created by luca strazzullo on 18/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import Foundation

struct Size: Hashable {

    let widthPercentage: Double
    let heightPercentage: Double


    init?(widthPercentage: Double, heightPercentage: Double) {
        guard widthPercentage > 0, heightPercentage > 0 else { return nil }
        self.widthPercentage = widthPercentage
        self.heightPercentage = heightPercentage
    }
}
