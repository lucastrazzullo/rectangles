//
//  Frame.swift
//  Rectangles
//
//  Created by luca strazzullo on 18/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import Foundation

struct Frame: Hashable {

    let position: Position
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
        let x = max(frame1.position.x, frame2.position.x)
        let y = max(frame1.position.y, frame2.position.y)

        let maximumX = min(frame1.position.x + frame1.size.width, frame2.position.x + frame2.size.width)
        let maximumY = min(frame1.position.y + frame1.size.height, frame2.position.y + frame2.size.height)

        let width = maximumX - x
        let height = maximumY - y

        let size = Size(width: width, height: height)
        let position = Position(x: x, y: y)

        if let size = size {
            return Frame(position: position, size: size)
        } else {
            return nil
        }
    }
}
