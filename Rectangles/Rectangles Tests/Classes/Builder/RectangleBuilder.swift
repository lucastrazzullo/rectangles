//
//  RectangleBuilder.swift
//  Rectangles Tests
//
//  Created by luca strazzullo on 18/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import Foundation
@testable import Rectangles

class RectangleBuilder {

    static func buildRectangleWith(xPercentage: Double, yPercentage: Double, widthPercentage: Double, heightPercentage: Double) -> Rectangle? {
        guard let size = Size(widthPercentage: widthPercentage, heightPercentage: heightPercentage) else { return nil }
        let center = AnyPosition(xPercentage: xPercentage, yPercentage: yPercentage)
        return AnyRectangle(center: center, size: size)
    }
}
