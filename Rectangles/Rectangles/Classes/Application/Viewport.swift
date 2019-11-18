//
//  Viewport.swift
//  Rectangles
//
//  Created by luca strazzullo on 18/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import Foundation

protocol ViewportDelegate: AnyObject {
    func viewport(_ viewport: Viewport, didUpdate overlappedRectangle: Rectangle?)
}


class Viewport {

    weak var delegate: ViewportDelegate? {
        didSet {
            checkOverlappedRectangles()
        }
    }

    private(set) var rectangle1: Rectangle
    private(set) var rectangle2: Rectangle

    var rectangle1Identifier: UUID = UUID()
    var rectangle2Identifier: UUID = UUID()


    // MARK: Object life cycle

    init(rectangle1: Rectangle, rectangle2: Rectangle) {
        self.rectangle1 = rectangle1
        self.rectangle2 = rectangle2
    }


    // MARK: Public methods

    func update(center: Position, forRectangleWith identifier: UUID) {
        if identifier == rectangle1Identifier {
            rectangle1.center = center
        }
        if identifier == rectangle2Identifier {
            rectangle2.center = center
        }
        checkOverlappedRectangles()
    }


    // MARK: Overlap checking logic

    private func checkOverlappedRectangles() {
        delegate?.viewport(self, didUpdate: getOverlappedRectangle())
    }


    private func getOverlappedRectangle() -> Rectangle? {
        return rectangle1.overlapped(with: rectangle2)
    }
}
