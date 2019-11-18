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
        let size = Size(width: 10, height: 10)
        XCTAssertNotNil(size)
    }


    func testWrongInstantiation() {
        let size = Size(width: 0, height: 10)
        XCTAssertNil(size)
    }
}
