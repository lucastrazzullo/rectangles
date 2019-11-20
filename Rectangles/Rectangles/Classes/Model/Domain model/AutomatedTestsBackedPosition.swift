//
//  AutomatedTestsBackedPosition.swift
//  Rectangles
//
//  Created by luca strazzullo on 20/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import Foundation

struct AutomatedTestsBackedPosition: Position, Decodable {

    enum CodingKeys: String, CodingKey {
        case x
        case y
    }


    // MARK: Instance properties

    let xPercentage: Double
    let yPercentage: Double


    // MARK: Object life cycle

    init(xPercentage: Double, yPercentage: Double) {
        self.xPercentage = xPercentage
        self.yPercentage = yPercentage
    }


    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        xPercentage = try container.decode(Double.self, forKey: .x)
        yPercentage = try container.decode(Double.self, forKey: .y)
    }
}
