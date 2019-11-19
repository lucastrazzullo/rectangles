//
//  PositionsRepository.swift
//  Rectangles
//
//  Created by luca strazzullo on 19/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import Foundation
import Combine

protocol PositionsRepository {
    func fetchPositions() -> AnyPublisher<[AnyPosition], Never>
    func pushPositions(_ positions: [AnyPosition])
}
