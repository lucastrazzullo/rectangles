//
//  FileBackedRectangle.swift
//  Rectangles
//
//  Created by luca strazzullo on 19/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import Foundation

struct FileBackedRectangle: Rectangle, Decodable {

    enum CodingKeys: String, CodingKey {
        case x
        case y
        case size
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
        let sideLengthPercentage = try container.decode(Double.self, forKey: .size)

        center = Position(xPercentage: xPercentage, yPercentage: yPercentage)
        size = try FileBackedRectangle.parseSize(with: sideLengthPercentage)
    }


    // MARK: Private helper methods

    private static func parseSize(with sideLengthPercentage: Double) throws -> Size {
        guard let size = Size(widthPercentage: sideLengthPercentage, heightPercentage: sideLengthPercentage) else {
            throw DecodingError.valueNotFound(Size.self, DecodingError.Context(codingPath: [], debugDescription: "Size is not valid"))
        }
        return size
    }
}
