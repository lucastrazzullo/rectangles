//
//  RectangleViewModelFactory.swift
//  Rectangles
//
//  Created by luca strazzullo on 18/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import UIKit

struct RectangleViewModelFactory {

    static func makeRectangleViewModel(with rectangle: Rectangle, identifier: UUID) -> RectangleViewModel {
        return RectangleViewModel(identifier: identifier, frame: frame(from: rectangle))
    }


    static func makeOverlapViewModel(with rectangle: Rectangle) -> OverlapViewModel {
        return OverlapViewModel(frame: frame(from: rectangle), area: rectangle.area)
    }


    // MARK: Private helper methods

    static private func frame(from rectangle: Rectangle) -> CGRect {
        let origin = CGPoint(x: CGFloat(rectangle.center.x - rectangle.size.width / 2), y: CGFloat(rectangle.center.y - rectangle.size.height / 2))
        let size = CGSize(width: CGFloat(rectangle.size.width), height: CGFloat(rectangle.size.height))
        return CGRect(origin: origin, size: size)
    }
}
