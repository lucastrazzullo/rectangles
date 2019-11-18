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

    static func buildRectangleWith(x: Float, y: Float, width: Float, height: Float) -> Rectangle? {
        guard let size = Size(width: width, height: height) else { return nil }
        let center = Position(x: x, y: y)
        return Rectangle(center: center, size: size)
    }
}
