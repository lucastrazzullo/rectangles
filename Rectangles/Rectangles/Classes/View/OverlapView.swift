//
//  OverlapView.swift
//  Rectangles
//
//  Created by luca strazzullo on 18/11/19.
//  Copyright © 2019 luca strazzullo. All rights reserved.
//

import UIKit

class OverlapView: UIView {

    @IBOutlet private var areaLabel: UILabel!


    // MARK: Object life cycle

    static func fromXib() -> OverlapView? {
        let nib = UINib(nibName: "OverlapView", bundle: nil)
        return nib.instantiate(withOwner: nil, options: nil).first as? OverlapView
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.systemTeal.withAlphaComponent(0.75)
        accessibilityIdentifier = "overlap"
    }


    // MARK: Public methods

    func setup(with viewModel: OverlapViewModel) {
        frame = viewModel.frame
        areaLabel.text = viewModel.area
    }
}
