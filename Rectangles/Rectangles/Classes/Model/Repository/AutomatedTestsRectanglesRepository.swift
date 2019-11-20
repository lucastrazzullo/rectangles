//
//  AutomatedTestsRectanglesRepository.swift
//  Rectangles
//
//  Created by luca strazzullo on 20/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import Foundation
import Combine

class AutomatedTestsRectanglesRepository: RectanglesRepository {

    static let isAutomatedTestRunningKey: String = "automated-tests"
    static let rectanglesKey: String = "rectangles"


    // MARK: Instance properties

    private let arguments: [String]


    // MARK: Object life cycle

    init?(with arguments: [String]) {
        guard arguments.contains(AutomatedTestsRectanglesRepository.isAutomatedTestRunningKey) else { return nil }
        self.arguments = arguments
    }


    // MARK: Public methods

    func fetchRectangles() -> AnyPublisher<[AnyRectangle], Never> {
        guard
            let rectanglesPair = CommandLine.arguments.first(where: { $0.starts(with: AutomatedTestsRectanglesRepository.rectanglesKey) }),
            let rectanglesObject = rectanglesPair.split(separator: "=").last,
            let rectanglesList = try? JSONDecoder().decode([AutomatedTestsBackedRectangle].self, from: Data(rectanglesObject.utf8)) else {
            return Just([]).eraseToAnyPublisher()
        }

        let rectangles = rectanglesList.map(AnyRectangle.init)

        return Just(rectangles).eraseToAnyPublisher()
    }
}
