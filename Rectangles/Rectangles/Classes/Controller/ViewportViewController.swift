//
//  ViewportViewController.swift
//  Rectangles
//
//  Created by luca strazzullo on 18/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import UIKit
import Combine

class ViewportViewController: UIViewController {

    private let rectanglesRepository: RectanglesRepository
    private let positionsRepository: PositionsRepository
    private var repositoryStream: AnyCancellable?

    private let viewDataSource: ViewportDataSource
    @IBOutlet private var viewportView: ViewportView!


    // MARK: Object life cycle

    required init?(coder: NSCoder) {
        rectanglesRepository = FileRectanglesRepository(resource: "Rectangles", type: .json)
        positionsRepository = CachePositionsRepository()
        viewDataSource = ViewportDataSource()
        super.init(coder: coder)
    }


    // MARK: View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        viewportView.delegate = self
        viewDataSource.view = viewportView
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchRectangles()
    }


    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        repositoryStream?.cancel()
    }


    // MARK: Private helper methdos

    private func fetchRectangles() {
        let rectanglesPublisher = rectanglesRepository.fetchRectangles()
        let positionsPublisher = positionsRepository.fetchPositions()

        repositoryStream?.cancel()
        repositoryStream = Publishers.CombineLatest(rectanglesPublisher, positionsPublisher).eraseToAnyPublisher().sink {
            [weak self] rectangles, positions in
            var rectangles = rectangles
            positions.enumerated().forEach({ index, position in
                rectangles[index].center = position
            })
            self?.viewDataSource.setRectangles(rectangles)
        }
    }
}


extension ViewportViewController: ViewportViewDelegate {

    func viewportView(_ view: ViewportView, isUpdating center: CGPoint, at index: Int) {
        viewDataSource.updateCenter(center, in: view.bounds, forRectangleAt: index)
    }


    func viewportView(_ view: ViewportView, didUpdate center: CGPoint, at index: Int) {
        positionsRepository.pushPositions(viewDataSource.rectangles.map({ AnyPosition($0.center) }))
    }
}
