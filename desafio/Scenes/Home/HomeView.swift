//
//  HomeView.swift
//  desafio
//
//  Created by Caio Cardozo on 27/07/23.
//

import UIKit
import SnapKit

final class HomeView: BaseView {
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello Caio"
        label.textColor = .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    override func addViews() {
        self.backgroundColor = .white
        self.addSubview(infoLabel)
    }
    override func addConstraints() {
        infoLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
