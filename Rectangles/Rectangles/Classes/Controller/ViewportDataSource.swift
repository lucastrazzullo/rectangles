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
        }
    }

    private(set) var rectangles: [AnyRectangle] = []
    private var overlaps: [AnyRectangle] = []


    // MARK: Data

    func setRectangles(_ list: [AnyRectangle]) {
        rectangles = list
        overlaps = Array(rectangles.reduce(Set<AnyRectangle>(), { [weak self] overlaps, rectangle in
            if let overlapsForRectangle = self?.overlaps(for: rectangle) {
                return overlaps.union(Set(overlapsForRectangle))
            } else {
                return overlaps
            }
        }))

        view?.reloadRectangles()
        view?.reloadOverlaps()
    }


    func updateCenter(_ center: CGPoint, in bounds: CGRect, forRectangleAt index: Int) {
        let xPercentage = Double(center.x / bounds.width)
        let yPercentage = Double(center.y / bounds.height)
        let center = AnyPosition(xPercentage: xPercentage, yPercentage: yPercentage)

        let previousRectangle = rectangles[index]
        rectangles[index].center = center

        let overlapsToRemove = Set(overlaps(for: previousRectangle))
        let overlapsToAdd = Set(overlaps(for: rectangles[index]))
        overlaps = Array(Set(overlaps).subtracting(overlapsToRemove).union(overlapsToAdd))

        view?.reloadOverlaps()
    }


    // MARK: Private helper methods

    private func overlaps(for rectangle: AnyRectangle) -> [AnyRectangle] {
        return rectangles.compactMap { checkingRectangle in
            if checkingRectangle != rectangle, let overlappedRectangle = checkingRectangle.overlapped(with: rectangle) {
                return AnyRectangle(overlappedRectangle)
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
