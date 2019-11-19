//
//  CachePositionsRepository.swift
//  Rectangles
//
//  Created by luca strazzullo on 19/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import Foundation
import Combine

class CachePositionsRepository: PositionsRepository {

    private static let resourceName = "rectangles.positions"


    func fetchPositions() -> AnyPublisher<[AnyPosition], Never> {
        return Future<[AnyPosition], Never> { promise in
            if let data = UserDefaults.standard.data(forKey: CachePositionsRepository.resourceName),
                let list = try? JSONDecoder().decode([CacheBackedPosition].self, from: data) {
                promise(.success(list.map(AnyPosition.init)))
            } else {
                promise(.success([]))
            }
        }.eraseToAnyPublisher()
    }


    func pushPositions(_ positions: [AnyPosition]) {
        let positions = positions.map(CacheBackedPosition.init)
        if let data = try? JSONEncoder().encode(positions) {
            UserDefaults.standard.set(data, forKey: CachePositionsRepository.resourceName)
        }
    }
}
