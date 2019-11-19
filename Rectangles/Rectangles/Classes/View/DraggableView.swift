//
//  DraggableView.swift
//  Rectangles
//
//  Created by luca strazzullo on 18/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import UIKit

protocol DraggableViewDelegate: AnyObject {
    func draggableViewWillStartDragging(_ view: DraggableView)
    func draggableViewDidEndDragging(_ view: DraggableView)
    func draggableViewDidUpdate(_ view: DraggableView)
}


class DraggableView: UIView {

    weak var delegate: DraggableViewDelegate?

    private var startDraggingCenter: CGPoint? {
        didSet {
            if startDraggingCenter != nil {
                delegate?.draggableViewWillStartDragging(self)
            } else {
                delegate?.draggableViewDidEndDragging(self)
            }
        }
    }

    override var center: CGPoint {
        didSet {
            delegate?.draggableViewDidUpdate(self)
        }
    }


    // MARK: View life cycle

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panRecognized(with:))))
    }


    // MARK: Gesture

    @objc private func panRecognized(with gestureRecognizer: UIPanGestureRecognizer) {
        switch gestureRecognizer.state {
        case .began:
            startDragging()
        case .changed:
            dragged(with: gestureRecognizer.translation(in: superview))
        case .ended:
            endDragging()
        default:
            resetDragging()
        }
    }


    // MARK: Dragging

    private func startDragging() {
        startDraggingCenter = center
    }


    private func endDragging() {
        if startDraggingCenter != nil {
            startDraggingCenter = nil
        }
    }


    private func resetDragging() {
        if let initialCenter = startDraggingCenter {
            center = initialCenter
            startDraggingCenter = nil
        }
    }


    private func dragged(with offset: CGPoint) {
        if let initialCenter = startDraggingCenter {
            var newCenter = initialCenter
            newCenter.x += offset.x
            newCenter.y += offset.y
            center = newCenter
        }
    }
}
