//
//  ViewportViewController.swift
//  Rectangles
//
//  Created by luca strazzullo on 18/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import UIKit

class ViewportViewController: UIViewController {

    private let viewport: Viewport

    @IBOutlet private var viewportView: ViewportView!


    // MARK: Object life cycle

    required init?(coder: NSCoder) {
        let rectangle1 = Rectangle(center: Position(x: 200, y: 100), size: Size(width: 200, height: 100)!)
        let rectangle2 = Rectangle(center: Position(x: 200, y: 300), size: Size(width: 200, height: 100)!)
        viewport = Viewport(rectangle1: rectangle1, rectangle2: rectangle2)
        super.init(coder: coder)
    }


    // MARK: View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        viewport.delegate = self
        viewportView.delegate = self

        addRectangleViews()
    }


    // MARK: Private helper methods

    private func addRectangleViews() {
        let rectangle1ViewModel = RectangleViewModelFactory.makeRectangleViewModel(with: viewport.rectangle1, identifier: viewport.rectangle1Identifier)
        let rectangle2ViewModel = RectangleViewModelFactory.makeRectangleViewModel(with: viewport.rectangle2, identifier: viewport.rectangle2Identifier)

        viewportView.addOrUpdateRectangleView(with: rectangle1ViewModel)
        viewportView.addOrUpdateRectangleView(with: rectangle2ViewModel)
    }


    private func updateOverlapView(with rectangle: Rectangle?) {
        if let rectangle = rectangle {
            let viewModel = RectangleViewModelFactory.makeOverlapViewModel(with: rectangle)
            viewportView.addOrUpdateOverlapView(with: viewModel)
        } else {
            viewportView.removeOverlapView()
        }
    }
}


extension ViewportViewController: ViewportDelegate {

    func viewport(_ viewport: Viewport, didUpdate overlappedRectangle: Rectangle?) {
        updateOverlapView(with: overlappedRectangle)
    }
}


extension ViewportViewController: ViewportViewDelegate {

    func viewportView(_ view: ViewportView, didUpdateRectangle center: CGPoint, with identifier: UUID) {
        let position = Position(x: Float(center.x), y: Float(center.y))
        viewport.update(center: position, forRectangleWith: identifier)
    }
}
