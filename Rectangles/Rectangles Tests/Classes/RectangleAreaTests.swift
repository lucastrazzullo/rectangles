//
//  RectangleAreaTests.swift
//  Rectangles Tests
//
//  Created by luca strazzullo on 18/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import XCTest
@testable import Rectangles

class RectangleAreaTests: XCTestCase {

    func testArea() {
        let rectangle = RectangleBuilder.buildRectangleWith(x: 0, y: 0, width: 10, height: 10)
        let expectedArea = Float(100)

        XCTAssertEqual(rectangle?.area, expectedArea)
    }


    func testAreaWithDifferentSides() {
        let rectangle = RectangleBuilder.buildRectangleWith(x: 0, y: 0, width: 10, height: 20)
        let expectedArea = Float(200)

        XCTAssertEqual(rectangle?.area, expectedArea)
    }


    func testAreaAtDifferentPositions() {
        let rectangle = RectangleBuilder.buildRectangleWith(x: 30, y: 30, width: 10, height: 20)
        let expectedArea = Float(200)

        XCTAssertEqual(rectangle?.area, expectedArea)
    }
}
