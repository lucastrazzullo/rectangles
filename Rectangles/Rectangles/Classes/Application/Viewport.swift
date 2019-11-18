//
//  Viewport.swift
//  Rectangles
//
//  Created by luca strazzullo on 18/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import Foundation

protocol ViewportDelegate: AnyObject {
    func viewport(_ viewport: Viewport, didOccour overlappedFrame: Frame?)
}


class Viewport {

    weak var delegate: ViewportDelegate? {
        didSet {
            checkOverlappedFrames()
        }
    }

    var frame1: Frame? {
        didSet {
            checkOverlappedFrames()
        }
    }
    var frame2: Frame? {
        didSet {
            checkOverlappedFrames()
        }
    }


    // MARK: Object life cycle

    init(frame1: Frame, frame2: Frame) {
        self.frame1 = frame1
        self.frame2 = frame2
    }


    // MARK: Overlap checking logic

    private func checkOverlappedFrames() {
        delegate?.viewport(self, didOccour: getOverlappedFrame())
    }


    private func getOverlappedFrame() -> Frame? {
        guard let frame1 = frame1, let frame2 = frame2 else { return nil }
        return frame1.overlapped(with: frame2)
    }
}
