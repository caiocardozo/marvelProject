//
//  ComicTableViewCell.swift
//  desafio
//
//  Created by Caio Cardozo on 28/07/23.
//

import UIKit
import SnapKit

final class ComicTableViewCell: UITableViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 12.0)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        addConstraints()
        
        self.accessoryType  = .none
        self.selectionStyle = .none
        self.preservesSuperviewLayoutMargins = false
        self.separatorInset = UIEdgeInsets.zero
        self.layoutMargins = UIEdgeInsets.zero
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        self.backgroundColor = .clear
        
        contentView.addSubview(titleLabel)
    }
    
    private func addConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(16)
        }
    }
    
    func setup(comicItem: ComicItem) {
        titleLabel.text = comicItem.title
    }
    
}
