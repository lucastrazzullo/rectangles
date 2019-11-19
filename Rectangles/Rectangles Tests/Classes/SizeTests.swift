//
//  SizeTests.swift
//  Rectangles Tests
//
//  Created by luca strazzullo on 18/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import XCTest
@testable import Rectangles

class SizeTests: XCTestCase {

    func testCorrectInstantiation() {
        let size = Size(widthPercentage: 0.1, heightPercentage: 0.1)
        XCTAssertNotNil(size)
    }


    func testWrongInstantiation() {
        let size = Size(widthPercentage: 0, heightPercentage: 0.1)
        XCTAssertNil(size)
    }
}
