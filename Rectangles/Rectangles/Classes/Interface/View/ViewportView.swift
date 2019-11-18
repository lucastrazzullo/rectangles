//
//  ViewportView.swift
//  Rectangles
//
//  Created by luca strazzullo on 18/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import UIKit

protocol ViewportViewDelegate: AnyObject {
    func viewportView(_ view: ViewportView, didUpdateRectangle center: CGPoint, with identifier: UUID)
}


class ViewportView: UIView {

    weak var delegate: ViewportViewDelegate?

    @IBOutlet private var rectangleViewsContainer: UIView!
    @IBOutlet private var overlapViewsContainer: UIView!


    // MARK: Public methods

    func addOrUpdateRectangleView(with viewModel: RectangleViewModel) {
        if let view = rectangleViewsContainer.subviews.compactMap({ $0 as? RectangleView }).first(where: { $0.identifier == viewModel.identifier }) {
            view.setup(with: viewModel)
        } else if let view = RectangleView.fromXib() {
            view.setup(with: viewModel)
            view.delegate = self
            rectangleViewsContainer.addSubview(view)
        }
    }


    func addOrUpdateOverlapView(with viewModel: OverlapViewModel) {
        if let view = overlapViewsContainer.subviews.compactMap({ $0 as? OverlapView }).first {
            view.setup(with: viewModel)
        } else if let view = OverlapView.fromXib() {
            view.setup(with: viewModel)
            overlapViewsContainer.addSubview(view)
        }
    }


    func removeOverlapView() {
        overlapViewsContainer.subviews.forEach({ $0.removeFromSuperview() })
    }
}


extension ViewportView: DraggableViewDelegate {

    func draggableViewWillStartDragging(_ view: DraggableView) {
        view.superview?.bringSubviewToFront(view)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowRadius = 0.2
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
    }


    func draggableViewDidEndDragging(_ view: DraggableView) {
        view.layer.shadowColor = nil
        view.layer.shadowOpacity = 0
    }


    func draggableViewDidUpdate(_ view: DraggableView) {
        if let view = view as? RectangleView, let identifier = view.identifier {
            delegate?.viewportView(self, didUpdateRectangle: view.center, with: identifier)
        }
    }
}
