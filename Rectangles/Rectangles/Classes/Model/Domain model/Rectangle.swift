//
//  Rectangle.swift
//  Rectangles
//
//  Created by luca strazzullo on 18/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import Foundation

protocol Rectangle {
    var center: Position { get set }
    var size: Size { get }
    init(center: Position, size: Size)
}


extension Rectangle {

    func area(withViewport width: Double, height: Double) -> Double {
        return size.widthPercentage * width * size.heightPercentage * height
    }


    func overlapped(with rectangle: Rectangle) -> Rectangle? {
        return Self.withOverlapBetween(rectangle1: self, rectangle2: rectangle)
    }


    // MARK: Private helper methods

    private static func withOverlapBetween(rectangle1: Rectangle, rectangle2: Rectangle) -> Rectangle? {
        let minimumX = max(rectangle1.center.xPercentage - rectangle1.size.widthPercentage / 2, rectangle2.center.xPercentage - rectangle2.size.widthPercentage / 2)
        let minimumY = max(rectangle1.center.yPercentage - rectangle1.size.heightPercentage / 2, rectangle2.center.yPercentage - rectangle2.size.heightPercentage / 2)

        let maximumX = min(rectangle1.center.xPercentage + rectangle1.size.widthPercentage / 2, rectangle2.center.xPercentage + rectangle2.size.widthPercentage / 2)
        let maximumY = min(rectangle1.center.yPercentage + rectangle1.size.heightPercentage / 2, rectangle2.center.yPercentage + rectangle2.size.heightPercentage / 2)

        let width = maximumX - minimumX
        let height = maximumY - minimumY

        let center = AnyPosition(xPercentage: minimumX + width / 2, yPercentage: minimumY + height / 2)
        if let size = Size(widthPercentage: width, heightPercentage: height) {
            return Self(center: center, size: size)
        } else {
            return nil
        }
    }
}
