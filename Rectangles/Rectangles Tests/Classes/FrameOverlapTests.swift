//
//  FrameOverlapTests.swift
//  Rectangles Tests
//
//  Created by luca strazzullo on 18/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import XCTest
@testable import Rectangles

class FrameOverlapTests: XCTestCase {

    // Ovderlap - Positive positions

    func testOverlapWithPositivePositions() {
        let frame1 = FrameBuilder.buildFrameWith(x: 0, y: 0, width: 10, height: 10)!
        let frame2 = FrameBuilder.buildFrameWith(x: 5, y: 5, width: 10, height: 10)!

        let overlappedFrame = frame1.overlapped(with: frame2)
        let expectedOverlappedArea = Float(25)

        XCTAssertNotNil(overlappedFrame)
        XCTAssertEqual(overlappedFrame?.area, expectedOverlappedArea)
    }


    func testNoOverlapWithPositivePositions() {
        let frame1 = FrameBuilder.buildFrameWith(x: 0, y: 0, width: 10, height: 10)!
        let frame2 = FrameBuilder.buildFrameWith(x: 10, y: 10, width: 10, height: 10)!

        let overlappedFrame = frame1.overlapped(with: frame2)

        XCTAssertNil(overlappedFrame)
    }


    // Ovderlap - Negative positions

    func testOverlapWithNegativePositions() {
        let frame1 = FrameBuilder.buildFrameWith(x: -20, y: -5, width: 10, height: 10)!
        let frame2 = FrameBuilder.buildFrameWith(x: -15, y: -10, width: 10, height: 10)!

        let overlappedFrame = frame1.overlapped(with: frame2)
        let expectedOverlappedArea = Float(25)

        XCTAssertNotNil(overlappedFrame)
        XCTAssertEqual(overlappedFrame?.area, expectedOverlappedArea)
    }


    func testNoOverlapWithNegativePositions() {
        let frame1 = FrameBuilder.buildFrameWith(x: -20, y: -5, width: 10, height: 10)!
        let frame2 = FrameBuilder.buildFrameWith(x: -10, y: -5, width: 10, height: 10)!

        let overlappedFrame = frame1.overlapped(with: frame2)

        XCTAssertNil(overlappedFrame)
    }


    // Ovderlap - Decimal positions

    func testOverlapWithDecimalPositions() {
        let frame1 = FrameBuilder.buildFrameWith(x: 0.5, y: 0.5, width: 10, height: 10)!
        let frame2 = FrameBuilder.buildFrameWith(x: 9.5, y: 9.5, width: 10, height: 10)!

        let overlappedFrame = frame1.overlapped(with: frame2)
        let expectedOverlappedArea = Float(1)

        XCTAssertNotNil(overlappedFrame)
        XCTAssertEqual(overlappedFrame?.area, expectedOverlappedArea)
    }


    func testNoOverlapWithDecimalPositions() {
        let frame1 = FrameBuilder.buildFrameWith(x: 0.5, y: 0.5, width: 10, height: 10)!
        let frame2 = FrameBuilder.buildFrameWith(x: 11.5, y: 11.5, width: 10, height: 10)!

        let overlappedFrame = frame1.overlapped(with: frame2)

        XCTAssertNil(overlappedFrame)
    }
}
