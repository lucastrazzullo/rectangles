//
//  FormatterFactory.swift
//  Rectangles
//
//  Created by luca strazzullo on 19/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import Foundation

struct FormatterFactory {

    static let measureFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.alwaysShowsDecimalSeparator = false
        numberFormatter.usesSignificantDigits = true
        numberFormatter.maximumSignificantDigits = 4
        return numberFormatter
    }()
}
