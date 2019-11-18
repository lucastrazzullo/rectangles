//
//  FrameTests.swift
//  Rectangles Tests
//
//  Created by luca strazzullo on 18/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import XCTest
@testable import Rectangles

class FrameTests: XCTestCase {

    // - Positive positions

    func testOverlapWithPositivePositions() {
        let size = Size(width: 10, height: 10)!

        let frame1 = Frame(position: Position(x: 0, y: 0), size: size)
        let frame2 = Frame(position: Position(x: 5, y: 5), size: size)

        XCTAssertNotNil(frame1.overllapped(with: frame2))
    }


    func testNoOverlapWithPositivePositions() {
        let size = Size(width: 10, height: 10)!

        let frame1 = Frame(position: Position(x: 0, y: 0), size: size)
        let frame2 = Frame(position: Position(x: 10, y: 10), size: size)

        XCTAssertNil(frame1.overllapped(with: frame2))
    }


    // - Negative positions

    func testOverlapWithNegativePositions() {
        let size = Size(width: 10, height: 10)!

        let frame1 = Frame(position: Position(x: -20, y: -5), size: size)
        let frame2 = Frame(position: Position(x: -15, y: -10), size: size)

        XCTAssertNotNil(frame1.overllapped(with: frame2))
    }


    func testNoOverlapWithNegativePositions() {
        let size = Size(width: 10, height: 10)!

        let frame1 = Frame(position: Position(x: -20, y: -5), size: size)
        let frame2 = Frame(position: Position(x: -10, y: -5), size: size)

        XCTAssertNil(frame1.overllapped(with: frame2))
    }


    // - Decimal positions

    func testOverlapWithDecimalPositions() {
        let size = Size(width: 10, height: 10)!

        let frame1 = Frame(position: Position(x: 0.5, y: 0.5), size: size)
        let frame2 = Frame(position: Position(x: 9.5, y: 9.5), size: size)

        XCTAssertNotNil(frame1.overllapped(with: frame2))
    }


    func testNoOverlapWithDecimalPositions() {
        let size = Size(width: 10, height: 10)!

        let frame1 = Frame(position: Position(x: 0.5, y: 0.5), size: size)
        let frame2 = Frame(position: Position(x: 11.5, y: 11.5), size: size)

        XCTAssertNil(frame1.overllapped(with: frame2))
    }
}
