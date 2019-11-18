//
//  ViewportBuilder.swift
//  Rectangles Tests
//
//  Created by luca strazzullo on 18/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import Foundation
@testable import Rectangles

class ViewportBuilder {

    static func buildViewport(overlappedFrames: Bool) -> Viewport {
        let size = Size(width: 10, height: 10)!
        let center1 = Position(x: 0, y: 0)
        let center2 = overlappedFrames ? Position(x: 5, y: 5) : Position(x: 10, y: 10)
        return buildViewport(center1: center1, center2: center2, size: size)
    }


    static func buildViewport(center1: Position, center2: Position, size: Size) -> Viewport {
        let frame1 = Frame(center: center1, size: size)
        let frame2 = Frame(center: center2, size: size)
        return Viewport(frame1: frame1, frame2: frame2)
    }
}
