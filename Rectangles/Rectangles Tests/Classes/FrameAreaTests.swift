//
//  FrameAreaTests.swift
//  Rectangles Tests
//
//  Created by luca strazzullo on 18/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import XCTest
@testable import Rectangles

class FrameAreaTests: XCTestCase {

    func testArea() {
        let frame = FrameBuilder.buildFrameWith(x: 0, y: 0, width: 10, height: 10)
        let expectedArea = Float(100)

        XCTAssertEqual(frame?.area, expectedArea)
    }


    func testAreaWithDifferentSides() {
        let frame = FrameBuilder.buildFrameWith(x: 0, y: 0, width: 10, height: 20)
        let expectedArea = Float(200)

        XCTAssertEqual(frame?.area, expectedArea)
    }


    func testAreaAtDifferentPositions() {
        let frame = FrameBuilder.buildFrameWith(x: 30, y: 30, width: 10, height: 20)
        let expectedArea = Float(200)

        XCTAssertEqual(frame?.area, expectedArea)
    }
}
