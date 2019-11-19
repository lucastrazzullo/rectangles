//
//  RectanglesRepository.swift
//  Rectangles
//
//  Created by luca strazzullo on 19/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import Foundation

protocol RectanglesRepository {
    func fetchRectangles(with completion: @escaping ([AnyRectangle]) -> ())
}
