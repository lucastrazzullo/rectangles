//
//  ApplicationRepositoryFactory.swift
//  Rectangles
//
//  Created by luca strazzullo on 20/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import Foundation

class ApplicationRepositoryFactory {

    static var shared = ApplicationRepositoryFactory()


    // MARK: Rectangles repository

    #if DEBUG
    func makeRectanglesRepository() -> RectanglesRepository { return makeAutomatedRectanglesRepository() ?? makeFileRectanglesRepository() }
    #else
    func makeRectanglesRepository() -> RectanglesRepository { return makeFileRectanglesRepository() }
    #endif


    private func makeFileRectanglesRepository() -> RectanglesRepository {
        return FileRectanglesRepository(resource: "Rectangles", type: .json)
    }

    #if DEBUG
    private func makeAutomatedRectanglesRepository() -> RectanglesRepository? {
        return AutomatedTestsRectanglesRepository(with: CommandLine.arguments)
    }
    #endif


    // MARK: Positions repository

    #if DEBUG
    func makePositionsRepository() -> PositionsRepository { return makeAutomatedPositionsRepository() ?? makeCachePositionsRepository() }
    #else
    func makePositionsRepository() -> PositionsRepository { return makeCachePositionsRepository() }
    #endif


    func makeCachePositionsRepository() -> PositionsRepository {
        return CachePositionsRepository()
    }


    #if DEBUG
    private func makeAutomatedPositionsRepository() -> PositionsRepository? {
        return AutomatedTestsPositionsRepository(with: CommandLine.arguments)
    }
    #endif
}
