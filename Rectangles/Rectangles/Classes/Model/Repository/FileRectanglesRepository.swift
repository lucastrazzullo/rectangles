//
//  FileRectanglesRepository.swift
//  Rectangles
//
//  Created by luca strazzullo on 19/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import Foundation
import Combine

class FileRectanglesRepository: RectanglesRepository {

    enum ResourceType: String {
        case json = "json"
    }

    private let filePath: String?


    // MARK: Object life cycle

    init(resource: String, type: ResourceType) {
        filePath = Bundle.main.path(forResource: resource, ofType: type.rawValue)
    }


    // MARK: Public methods

    func fetchRectangles() -> AnyPublisher<[AnyRectangle], Never> {
        return Future<[AnyRectangle], Never> { [weak self] promise in
            guard let filePath = self?.filePath else { promise(.success([])); return }
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: filePath), options: .mappedIfSafe)
                let list = try JSONDecoder().decode(FileBackedRectangles.self, from: data)
                promise(.success(list.rectangles.map(AnyRectangle.init)))
            } catch {
                promise(.success([]))
            }
        }.eraseToAnyPublisher()
    }
}
