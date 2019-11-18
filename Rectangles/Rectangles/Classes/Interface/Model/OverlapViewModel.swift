//
//  OverlapViewModel.swift
//  Rectangles
//
//  Created by luca strazzullo on 18/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import UIKit

struct OverlapViewModel {

    let frame: CGRect
    let area: String?


    init(frame: CGRect, area: Float) {
        self.frame = frame
        self.area = FormatterFactory.measureFormatter.string(from: NSNumber(value: area))
    }
}
