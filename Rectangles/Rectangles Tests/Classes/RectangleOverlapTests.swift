//
//  RectangleOverlapTests.swift
//  Rectangles Tests
//
//  Created by luca strazzullo on 18/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import XCTest
@testable import Rectangles

class RectangleOverlapTests: XCTestCase {

    // Ovderlap - Positive positions

    func testOverlapWithPositivePositions() {
        let rectangle1 = RectangleBuilder.buildRectangleWith(x: 0, y: 0, width: 10, height: 10)!
        let rectangle2 = RectangleBuilder.buildRectangleWith(x: 5, y: 5, width: 10, height: 10)!

        let overlappedRectangle = rectangle1.overlapped(with: rectangle2)
        let expectedOverlappedArea = Float(25)

        XCTAssertNotNil(overlappedRectangle)
        XCTAssertEqual(overlappedRectangle?.area, expectedOverlappedArea)
    }


    func testNoOverlapWithPositivePositions() {
        let rectangle1 = RectangleBuilder.buildRectangleWith(x: 0, y: 0, width: 10, height: 10)!
        let rectangle2 = RectangleBuilder.buildRectangleWith(x: 10, y: 10, width: 10, height: 10)!

        let overlappedRectangle = rectangle1.overlapped(with: rectangle2)

        XCTAssertNil(overlappedRectangle)
    }


    // Ovderlap - Negative positions

    func testOverlapWithNegativePositions() {
        let rectangle1 = RectangleBuilder.buildRectangleWith(x: -20, y: -5, width: 10, height: 10)!
        let rectangle2 = RectangleBuilder.buildRectangleWith(x: -15, y: -10, width: 10, height: 10)!

        let overlappedRectangle = rectangle1.overlapped(with: rectangle2)
        let expectedOverlappedArea = Float(25)

        XCTAssertNotNil(overlappedRectangle)
        XCTAssertEqual(overlappedRectangle?.area, expectedOverlappedArea)
    }


    func testNoOverlapWithNegativePositions() {
        let rectangle1 = RectangleBuilder.buildRectangleWith(x: -20, y: -5, width: 10, height: 10)!
        let rectangle2 = RectangleBuilder.buildRectangleWith(x: -10, y: -5, width: 10, height: 10)!

        let overlappedRectangle = rectangle1.overlapped(with: rectangle2)

        XCTAssertNil(overlappedRectangle)
    }


    // Ovderlap - Decimal positions

    func testOverlapWithDecimalPositions() {
        let rectangle1 = RectangleBuilder.buildRectangleWith(x: 0.5, y: 0.5, width: 10, height: 10)!
        let rectangle2 = RectangleBuilder.buildRectangleWith(x: 9.5, y: 9.5, width: 10, height: 10)!

        let overlappedRectangle = rectangle1.overlapped(with: rectangle2)
        let expectedOverlappedArea = Float(1)

        XCTAssertNotNil(overlappedRectangle)
        XCTAssertEqual(overlappedRectangle?.area, expectedOverlappedArea)
    }


    func testNoOverlapWithDecimalPositions() {
        let rectangle1 = RectangleBuilder.buildRectangleWith(x: 0.5, y: 0.5, width: 10, height: 10)!
        let rectangle2 = RectangleBuilder.buildRectangleWith(x: 11.5, y: 11.5, width: 10, height: 10)!

        let overlappedRectangle = rectangle1.overlapped(with: rectangle2)

        XCTAssertNil(overlappedRectangle)
    }
}
