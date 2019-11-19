//
//  RectangleViewModel.swift
//  Rectangles
//
//  Created by luca strazzullo on 18/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import UIKit

struct RectangleViewModel {

    let frame: CGRect
    let width: String?
    let height: String?


    init(frame: CGRect) {
        self.frame = frame
        self.width = FormatterFactory.measureFormatter.string(from: NSNumber(value: Float(frame.width)))
        self.height = FormatterFactory.measureFormatter.string(from: NSNumber(value: Float(frame.height)))
    }
}
