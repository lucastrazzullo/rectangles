//
//  RectanglesRepository.swift
//  Rectangles
//
//  Created by luca strazzullo on 19/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import Foundation

class RectanglesRepository {

    func getRectangles(with completion: @escaping ([Rectangle]) -> ()) {
        let size = Size(widthPercentage: 0.6, heightPercentage: 0.2)!
        completion([
            Rectangle(center: Position(xPercentage: 0.5, yPercentage: 0.2), size: size),
            Rectangle(center: Position(xPercentage: 0.5, yPercentage: 0.5), size: size),
            Rectangle(center: Position(xPercentage: 0.5, yPercentage: 0.8), size: size)
        ])
    }
}
