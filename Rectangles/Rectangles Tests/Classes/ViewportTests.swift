//
//  ViewportTests.swift
//  Rectangles Tests
//
//  Created by luca strazzullo on 18/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import XCTest
@testable import Rectangles

class ViewportTests: XCTestCase {

    func testOverlapProduced() {
        let overlapExistsExpectation = expectation(description: "overlap-exists")

        let delegate = TestingViewportDelegate()
        delegate.overlapExistsExpectation = overlapExistsExpectation

        let viewport = ViewportBuilder.buildViewport(overlappedRectangles: true)
        viewport.delegate = delegate

        wait(for: [overlapExistsExpectation], timeout: 0.1)
    }


    func testOverlapNotProduced() {
        let overlapNilExpectation = expectation(description: "overlap-nil")

        let delegate = TestingViewportDelegate()
        delegate.overlapNilExpectation = overlapNilExpectation

        let viewport = ViewportBuilder.buildViewport(overlappedRectangles: false)
        viewport.delegate = delegate

        wait(for: [overlapNilExpectation], timeout: 0.1)
    }


    func testOverlapEventsAfterUpdatingRectangles() {
        let overlapExistsExpectation = expectation(description: "overlap-exists")
        overlapExistsExpectation.expectedFulfillmentCount = 2

        let overlapNilExpectation = expectation(description: "overlap-nil")
        overlapNilExpectation.expectedFulfillmentCount = 2

        let delegate = TestingViewportDelegate()
        delegate.overlapExistsExpectation = overlapExistsExpectation
        delegate.overlapNilExpectation = overlapNilExpectation

        let size = Size(width: 10, height: 10)!
        let center1 = Position(x: -10, y: -10)
        let center2 = Position(x: 10, y: 10)
        let viewport = ViewportBuilder.buildViewport(center1: center1, center2: center2, size: size)

        // Will produce a nil overlap as the initial viewport has been built with no overlapped rectangles
        viewport.delegate = delegate

        // Will produce an overlap by moving the rectangle 1 in a position that overlaps with rectangle 2
        viewport.update(center: Position(x: 5, y: 5), forRectangleWith: viewport.rectangle1Identifier)

        // Will produce a nil overlap by moving the rectangle 2 out of a position that overlaps with rectangle 1
        viewport.update(center: Position(x: -10, y: -10), forRectangleWith: viewport.rectangle2Identifier)

        // Will produce an overlap by moving the rectangle 1 back to a position that overlaps with rectangle 2
        viewport.update(center: Position(x: -5, y: -5), forRectangleWith: viewport.rectangle1Identifier)

        wait(for: [overlapNilExpectation, overlapExistsExpectation], timeout: 0.1)
    }
}


class TestingViewportDelegate: ViewportDelegate {

    var overlapExistsExpectation: XCTestExpectation?
    var overlapNilExpectation: XCTestExpectation?


    // MARK: Delegate methods

    func viewport(_ viewport: Viewport, didUpdate overlappedRectangle: Rectangle?) {
        if overlappedRectangle != nil {
            overlapExistsExpectation?.fulfill()
        } else {
            overlapNilExpectation?.fulfill()
        }
    }
}
