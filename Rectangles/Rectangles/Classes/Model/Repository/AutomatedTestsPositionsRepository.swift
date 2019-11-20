//
//  AutomatedTestsPositionsRepository.swift
//  Rectangles
//
//  Created by luca strazzullo on 20/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import Foundation
import Combine

class AutomatedTestsPositionsRepository: PositionsRepository {

    static let isAutomatedTestRunningKey: String = "automated-tests"
    static let positionsKey: String = "positions"


    // MARK: Instance properties

    private let arguments: [String]


    // MARK: Object life cycle

    init?(with arguments: [String]) {
        guard arguments.contains(AutomatedTestsPositionsRepository.isAutomatedTestRunningKey) else { return nil }
        self.arguments = arguments
    }


    // MARK: Public methods

    func fetchPositions() -> AnyPublisher<[AnyPosition], Never> {
        guard
            let positionsPair = CommandLine.arguments.first(where: { $0.starts(with: AutomatedTestsRectanglesRepository.rectanglesKey) }),
            let positionsObject = positionsPair.split(separator: "=").last,
            let positionsList = try? JSONDecoder().decode([AutomatedTestsBackedPosition].self, from: Data(positionsObject.utf8)) else {
            return Just([]).eraseToAnyPublisher()
        }

        let positions = positionsList.map(AnyPosition.init)

        return Just(positions).eraseToAnyPublisher()
    }


    func pushPositions(_ positions: [AnyPosition]) {
    }
}
