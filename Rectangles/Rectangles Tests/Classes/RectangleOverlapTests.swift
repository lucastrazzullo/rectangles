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
        let rectangle1 = RectangleBuilder.buildRectangleWith(xPercentage: 0, yPercentage: 0, widthPercentage: 1, heightPercentage: 1)!
        let rectangle2 = RectangleBuilder.buildRectangleWith(xPercentage: 0.5, yPercentage: 0.5, widthPercentage: 1, heightPercentage: 1)!

        let overlappedRectangle = rectangle1.overlapped(with: rectangle2)

        let viewportWidth: Double = 10
        let viewportHeight: Double = 10
        let expectedOverlappedArea: Double = 25

        XCTAssertNotNil(overlappedRectangle)
        XCTAssertEqual(overlappedRectangle?.area(withViewport: viewportWidth, height: viewportHeight), expectedOverlappedArea)
    }


    func testNoOverlapWithPositivePositions() {
        let rectangle1 = RectangleBuilder.buildRectangleWith(xPercentage: 0, yPercentage: 0, widthPercentage: 0.5, heightPercentage: 0.5)!
        let rectangle2 = RectangleBuilder.buildRectangleWith(xPercentage: 0.5, yPercentage: 0.5, widthPercentage: 0.5, heightPercentage: 0.5)!

        let overlappedRectangle = rectangle1.overlapped(with: rectangle2)

        XCTAssertNil(overlappedRectangle)
    }


    // Ovderlap - Negative positions

    func testOverlapWithNegativePositions() {
        let rectangle1 = RectangleBuilder.buildRectangleWith(xPercentage: -1.0, yPercentage: -1.0, widthPercentage: 1, heightPercentage: 1)!
        let rectangle2 = RectangleBuilder.buildRectangleWith(xPercentage: -0.5, yPercentage: -0.5, widthPercentage: 1, heightPercentage: 1)!

        let overlappedRectangle = rectangle1.overlapped(with: rectangle2)

        let viewportWidth: Double = 10
        let viewportHeight: Double = 10
        let expectedOverlappedArea: Double = 25

        XCTAssertNotNil(overlappedRectangle)
        XCTAssertEqual(overlappedRectangle?.area(withViewport: viewportWidth, height: viewportHeight), expectedOverlappedArea)
    }


    func testNoOverlapWithNegativePositions() {
        let rectangle1 = RectangleBuilder.buildRectangleWith(xPercentage: -1.0, yPercentage: -0.5, widthPercentage: 0.5, heightPercentage: 0.5)!
        let rectangle2 = RectangleBuilder.buildRectangleWith(xPercentage: -0.5, yPercentage: -0.5, widthPercentage: 0.5, heightPercentage: 0.5)!

        let overlappedRectangle = rectangle1.overlapped(with: rectangle2)

        XCTAssertNil(overlappedRectangle)
    }
}
