//
//  ViewportDataSource.swift
//  Rectangles
//
//  Created by luca strazzullo on 19/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import UIKit

class ViewportDataSource {

    weak var view: ViewportView? {
        didSet {
            view?.dataSource = self
            view?.delegate = self
        }
    }

    private var rectangles: [Rectangle] = []
    private var overlaps: [Rectangle] = []


    // MARK: Public methods

    func setRectangles(_ list: [Rectangle]) {
        rectangles = list
        overlaps = Array(rectangles.reduce(Set<Rectangle>(), { [weak self] overlaps, rectangle in
            if let overlapsForRectangle = self?.overlaps(for: rectangle) {
                return overlaps.union(Set(overlapsForRectangle))
            } else {
                return overlaps
            }
        }))

        view?.reloadRectangles()
        view?.reloadOverlaps()
    }


    func updateCenter(_ center: Position, forRectangleAt index: Int) {
        let rectangle = rectangles[index]
        rectangles[index].center = center
        overlaps = Array(Set(overlaps).subtracting(Set(overlaps(for: rectangle))).union(Set(overlaps(for: rectangles[index]))))

        view?.reloadOverlaps()
    }


    // MARK: Private helper methods

    private func overlaps(for rectangle: Rectangle) -> [Rectangle] {
        return rectangles.compactMap { checkingRectangle in
            if checkingRectangle != rectangle, let overlappedRectangle = checkingRectangle.overlapped(with: rectangle) {
                return overlappedRectangle
            } else {
                return nil
            }
        }
    }
}


extension ViewportDataSource: ViewportViewDataSource {

    func numberOfRectanglesInViewportView(_ view: ViewportView) -> Int {
        return rectangles.count
    }


    func numberOfOverlapsInViewportView(_ view: ViewportView) -> Int {
        return overlaps.count
    }


    func viewportView(_ view: ViewportView, rectangleAt index: Int) -> RectangleView {
        let rectangle = rectangles[index]
        let viewModel = makeRectangleViewModel(with: rectangle)
        let view = RectangleView.fromXib()!
        view.setup(with: viewModel)
        return view
    }


    func viewportView(_ view: ViewportView, overlapAt index: Int) -> OverlapView {
        let rectangle = overlaps[index]
        let viewModel = makeOverlapViewModel(with: rectangle)
        let view = OverlapView.fromXib()!
        view.setup(with: viewModel)
        return view
    }


    // MARK: Private helper methods

    private func makeRectangleViewModel(with rectangle: Rectangle) -> RectangleViewModel {
        return RectangleViewModel(frame: frame(from: rectangle))
    }


    private func makeOverlapViewModel(with rectangle: Rectangle) -> OverlapViewModel {
        return OverlapViewModel(frame: frame(from: rectangle), area: area(from: rectangle))
    }


    private func area(from rectangle: Rectangle) -> Double {
        guard let view = view else { return 0 }
        return rectangle.area(withViewport: Double(view.bounds.width), height: Double(view.bounds.height))
    }


    private func frame(from rectangle: Rectangle) -> CGRect {
        guard let view = view else { return .zero }
        let x = CGFloat(rectangle.center.xPercentage) * view.bounds.width
        let y = CGFloat(rectangle.center.yPercentage) * view.bounds.height
        let width = CGFloat(rectangle.size.widthPercentage) * view.bounds.width
        let height = CGFloat(rectangle.size.heightPercentage) * view.bounds.height
        let origin = CGPoint(x: x - width / 2, y: y - height / 2)
        let size = CGSize(width: width, height: height)
        return CGRect(origin: origin, size: size)
    }
}


extension ViewportDataSource: ViewportViewDelegate {

    func viewportView(_ view: ViewportView, didUpdateRectangle center: CGPoint, at index: Int) {
        let xPercentage = Double(center.x / view.bounds.width)
        let yPercentage = Double(center.y / view.bounds.height)
        updateCenter(Position(xPercentage: xPercentage, yPercentage: yPercentage), forRectangleAt: index)
    }
}
