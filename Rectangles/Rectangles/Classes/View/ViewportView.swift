//
//  ViewportView.swift
//  Rectangles
//
//  Created by luca strazzullo on 18/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import UIKit

protocol ViewportViewDelegate: AnyObject {
    func viewportView(_ view: ViewportView, isUpdating center: CGPoint, at index: Int)
    func viewportView(_ view: ViewportView, didUpdate center: CGPoint, at index: Int)
}


protocol ViewportViewDataSource: AnyObject {
    func numberOfRectanglesInViewportView(_ view: ViewportView) -> Int
    func numberOfOverlapsInViewportView(_ view: ViewportView) -> Int
    func viewportView(_ view: ViewportView, rectangleAt index: Int) -> RectangleView
    func viewportView(_ view: ViewportView, overlapAt index: Int) -> OverlapView
}


class ViewportView: UIView {

    weak var delegate: ViewportViewDelegate?
    weak var dataSource: ViewportViewDataSource?

    private var rectangleIndexes: [RectangleView: Int] = [:]


    // MARK: UI Properties

    @IBOutlet private var rectangleViewsContainer: UIView!
    @IBOutlet private var overlapViewsContainer: UIView!


    // MARK: Public methods

    func reloadRectangles() {
        rectangleViewsContainer.subviews.forEach({ $0.removeFromSuperview() })
        rectangleIndexes = [:]

        if let numberOfRectangles = dataSource?.numberOfRectanglesInViewportView(self) {
            for index in 0..<numberOfRectangles {
                if let view = dataSource?.viewportView(self, rectangleAt: index) {
                    view.delegate = self
                    rectangleIndexes[view] = index
                    rectangleViewsContainer.addSubview(view)
                }
            }
        }
    }


    func reloadOverlaps() {
        overlapViewsContainer.subviews.forEach({ $0.removeFromSuperview() })

        if let numberOfOverlaps = dataSource?.numberOfOverlapsInViewportView(self) {
            for index in 0..<numberOfOverlaps {
                if let view = dataSource?.viewportView(self, overlapAt: index) {
                    overlapViewsContainer.addSubview(view)
                }
            }
        }
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

        if let view = view as? RectangleView, let index = rectangleIndexes[view] {
            delegate?.viewportView(self, didUpdate: view.center, at: index)
        }
    }


    func draggableViewDidUpdate(_ view: DraggableView) {
        if let view = view as? RectangleView, let index = rectangleIndexes[view] {
            delegate?.viewportView(self, isUpdating: view.center, at: index)
        }
    }
}
