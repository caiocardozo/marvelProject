//
//  BaseView.swift
//  desafio
//
//  Created by Caio Cardozo on 27/07/23.
//

import UIKit
import SnapKit

class BaseView: UIView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }

    required public init() {
        super.init(frame: CGRect.zero)
        self.setup()
    }
    public func setBackground() {
        self.backgroundColor = .white
    }
    func addViews() { fatalError("Must be overridden") }

    func addConstraints() { fatalError("Must be overridden") }

    func setupExtraConfigurations() {}

    // MARK: Private
    fileprivate func setup() {
        self.setBackground()
        self.addViews()
        self.addConstraints()
        self.setupExtraConfigurations()
    }
}
