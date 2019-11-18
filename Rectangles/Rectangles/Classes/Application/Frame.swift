//
//  Frame.swift
//  Rectangles
//
//  Created by luca strazzullo on 18/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import Foundation

struct Frame {

    var center: Position
    let size: Size


    // MARK: Public methods

    var area: Float {
        return size.width * size.height
    }


    func overlapped(with frame: Frame) -> Frame? {
        return Frame.withOverlapBetween(frame1: self, frame2: frame)
    }


    // MARK: Private helper methods

    private static func withOverlapBetween(frame1: Frame, frame2: Frame) -> Frame? {
        let minimumX = max(frame1.center.x - frame1.size.width / 2, frame2.center.x - frame2.size.width / 2)
        let minimumY = max(frame1.center.y - frame1.size.height / 2, frame2.center.y - frame2.size.height / 2)

        let maximumX = min(frame1.center.x + frame1.size.width / 2, frame2.center.x + frame2.size.width / 2)
        let maximumY = min(frame1.center.y + frame1.size.height / 2, frame2.center.y + frame2.size.height / 2)

        let width = maximumX - minimumX
        let height = maximumY - minimumY

        let size = Size(width: width, height: height)
        let center = Position(x: minimumX + width / 2, y: minimumY + height / 2)

        if let size = size {
            return Frame(center: center, size: size)
        } else {
            return nil
        }
    }
}
