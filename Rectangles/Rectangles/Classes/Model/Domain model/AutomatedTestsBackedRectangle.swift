//
//  AutomatedTestsBackedRectangle.swift
//  Rectangles
//
//  Created by luca strazzullo on 20/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import Foundation

struct AutomatedTestsBackedRectangle: Rectangle, Decodable {

    enum CodingKeys: String, CodingKey {
        case x
        case y
        case width
        case height
    }


    // MARK: Instance properties

    var center: Position
    let size: Size


    // MARK: Object life cycle

    init(center: Position, size: Size) {
        self.center = center
        self.size = size
    }


    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let xPercentage = try container.decode(Double.self, forKey: .x)
        let yPercentage = try container.decode(Double.self, forKey: .y)
        let widthPercentage = try container.decode(Double.self, forKey: .width)
        let heightPercentage = try container.decode(Double.self, forKey: .height)

        center = AnyPosition(xPercentage: xPercentage, yPercentage: yPercentage)
        size = Size(widthPercentage: widthPercentage, heightPercentage: heightPercentage)!
    }
}
