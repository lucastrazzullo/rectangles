//
//  RectangleView.swift
//  Rectangles
//
//  Created by luca strazzullo on 18/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import UIKit

class RectangleView: DraggableView {

    private(set) var identifier: UUID?

    @IBOutlet private var widthLabel: UILabel!
    @IBOutlet private var heightLabel: UILabel!


    // MARK: Object life cycle

    static func fromXib() -> RectangleView? {
        let nib = UINib(nibName: "RectangleView", bundle: nil)
        return nib.instantiate(withOwner: nil, options: nil).first as? RectangleView
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.systemPink
    }


    // MARK: Public methods

    func setup(with viewModel: RectangleViewModel) {
        frame = viewModel.frame
        identifier = viewModel.identifier
        widthLabel.text = viewModel.width
        heightLabel.text = viewModel.height
    }
}
