//
//  FrameBuilder.swift
//  Rectangles Tests
//
//  Created by luca strazzullo on 18/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import Foundation
@testable import Rectangles

class FrameBuilder {

    static func buildFrameWith(x: Float, y: Float, width: Float, height: Float) -> Frame? {
        guard let size = Size(width: width, height: height) else { return nil }
        let center = Position(x: x, y: y)
        return Frame(center: center, size: size)
    }
}
