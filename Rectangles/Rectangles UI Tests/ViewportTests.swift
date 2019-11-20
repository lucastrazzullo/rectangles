//
//  ViewportTests.swift
//  Rectangles UI Tests
//
//  Created by luca strazzullo on 20/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import XCTest

class ViewportTests: XCTestCase {

    private var application: XCUIApplication?


    // MARK: Test life cycle

    override func setUp() {
        application = XCUIApplication()
        application?.launchArguments = [
            "automated-tests",
            "rectangles=[{\"x\": 0.25, \"y\": 0.5, \"width\": 0.5, \"height\": 0.5}, {\"x\": 0.75, \"y\": 0.5, \"width\": 0.5, \"height\": 0.5}]",
            "positions=[]"
        ]

        continueAfterFailure = false
    }


    override func tearDown() {
        application = nil
    }


    // MARK: Tests

    func testRectanglesAppear() {
        guard let application = application else { XCTFail(); return }
        application.launch()

        XCTAssertTrue(application.otherElements["rectangle"].waitForExistence(timeout: 0.1))
    }


    func testOverlapAppears() {
        guard let application = application else { XCTFail(); return }
        application.launch()

        XCTAssertFalse(application.otherElements["overlap"].exists)

        let rectangle = application.otherElements["rectangle"].firstMatch
        let startDragPosition = rectangle.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5))
        let endDragPosition = rectangle.coordinate(withNormalizedOffset: CGVector(dx: 0.75, dy: 0.5))
        startDragPosition.press(forDuration: 0.5, thenDragTo: endDragPosition)

        XCTAssertTrue(application.otherElements["overlap"].waitForExistence(timeout: 1))
    }
}
