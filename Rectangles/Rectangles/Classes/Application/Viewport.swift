//
//  Viewport.swift
//  Rectangles
//
//  Created by luca strazzullo on 18/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import Foundation

class Viewport {

    private let size: Size


    // MARK: Object life cycle

    init?(size: Size) {
        guard size.width > 0, size.height > 0 else { return nil }
        self.size = size
    }
}
