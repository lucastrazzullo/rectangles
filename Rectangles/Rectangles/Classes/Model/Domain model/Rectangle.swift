//
//  Rectangle.swift
//  Rectangles
//
//  Created by luca strazzullo on 18/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import Foundation

struct Rectangle: Hashable {

    var center: Position
    let size: Size


    // MARK: Public getters

    var area: Float {
        return size.width * size.height
    }

    func overlapped(with rectangle: Rectangle) -> Rectangle? {
        return Rectangle.withOverlapBetween(rectangle1: self, rectangle2: rectangle)
    }


    // MARK: Private helper methods

    private static func withOverlapBetween(rectangle1: Rectangle, rectangle2: Rectangle) -> Rectangle? {
        let minimumX = max(rectangle1.center.x - rectangle1.size.width / 2, rectangle2.center.x - rectangle2.size.width / 2)
        let minimumY = max(rectangle1.center.y - rectangle1.size.height / 2, rectangle2.center.y - rectangle2.size.height / 2)

        let maximumX = min(rectangle1.center.x + rectangle1.size.width / 2, rectangle2.center.x + rectangle2.size.width / 2)
        let maximumY = min(rectangle1.center.y + rectangle1.size.height / 2, rectangle2.center.y + rectangle2.size.height / 2)

        let width = maximumX - minimumX
        let height = maximumY - minimumY

        let center = Position(x: minimumX + width / 2, y: minimumY + height / 2)
        if let size = Size(width: width, height: height) {
            return Rectangle(center: center, size: size)
        } else {
            return nil
        }
    }
}
