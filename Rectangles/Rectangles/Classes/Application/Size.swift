//
//  Size.swift
//  Rectangles
//
//  Created by luca strazzullo on 18/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import Foundation

struct Size {

    let width: Float
    let height: Float

    init?(width: Float, height: Float) {
        guard width > 0, height > 0 else { return nil }
        self.width = width
        self.height = height
    }
}
