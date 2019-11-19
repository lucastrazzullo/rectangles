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
        completion([
            Rectangle(center: Position(x: 200, y: 100), size: Size(width: 200, height: 100)!),
            Rectangle(center: Position(x: 200, y: 300), size: Size(width: 200, height: 100)!),
            Rectangle(center: Position(x: 200, y: 350), size: Size(width: 200, height: 100)!)
        ])
    }
}
