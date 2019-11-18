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

    func testCorrectViewportInstantiation() {
        let size = Size(width: 10, height: 10)
        let viewport = Viewport(size: size)
        XCTAssertNotNil(viewport)
    }


    func testWrongViewportInstantiation() {
        let size = Size(width: 0, height: 10)
        let viewport = Viewport(size: size)
        XCTAssertNil(viewport)
    }
}
