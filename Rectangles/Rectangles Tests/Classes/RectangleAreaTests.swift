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
        let rectangle = RectangleBuilder.buildRectangleWith(xPercentage: 0, yPercentage: 0, widthPercentage: 1, heightPercentage: 1)
        let viewportWidth: Double = 10
        let viewportHeight: Double = 10
        let expectedArea: Double = 100

        XCTAssertEqual(rectangle?.area(withViewport: viewportWidth, height: viewportHeight), expectedArea)
    }


    func testAreaWithDifferentSides() {
        let rectangle = RectangleBuilder.buildRectangleWith(xPercentage: 0, yPercentage: 0, widthPercentage: 1, heightPercentage: 2)
        let viewportWidth: Double = 10
        let viewportHeight: Double = 10
        let expectedArea: Double = 200

        XCTAssertEqual(rectangle?.area(withViewport: viewportWidth, height: viewportHeight), expectedArea)
    }


    func testAreaAtDifferentPositions() {
        let rectangle = RectangleBuilder.buildRectangleWith(xPercentage: 0.5, yPercentage: 0.3, widthPercentage: 1, heightPercentage: 2)
               let viewportWidth: Double = 10
               let viewportHeight: Double = 10
               let expectedArea: Double = 200

               XCTAssertEqual(rectangle?.area(withViewport: viewportWidth, height: viewportHeight), expectedArea)
    }
}
