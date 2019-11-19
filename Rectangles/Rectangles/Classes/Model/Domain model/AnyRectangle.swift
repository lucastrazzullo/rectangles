//
//  AnyRectangle.swift
//  Rectangles
//
//  Created by luca strazzullo on 19/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import Foundation

struct AnyRectangle: Rectangle, Hashable {

    var center: Position
    let size: Size


    // MARK: Object life cycle

    init(center: Position, size: Size) {
        self.center = center
        self.size = size
    }

    init(_ rectangle: Rectangle) {
        center = rectangle.center
        size = rectangle.size
    }
}
