//
//  ViewportViewController.swift
//  Rectangles
//
//  Created by luca strazzullo on 18/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import UIKit

class ViewportViewController: UIViewController {

    private let repository: RectanglesRepository
    private let viewDataSource: ViewportDataSource

    @IBOutlet private var viewportView: ViewportView!


    // MARK: Object life cycle

    required init?(coder: NSCoder) {
        repository = RectanglesRepository()
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


    // MARK: Private helper methdos

    private func fetchRectangles() {
        repository.getRectangles { [weak self] rectangles in
            self?.viewDataSource.setRectangles(rectangles)
        }
    }
}


extension ViewportViewController: ViewportViewDelegate {

    func viewportView(_ view: ViewportView, didUpdateRectangle center: CGPoint, at index: Int) {
        viewDataSource.updateCenter(Position(x: Float(center.x), y: Float(center.y)), forRectangleAt: index)
    }
}
