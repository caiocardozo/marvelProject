//
//  HomeView.swift
//  desafio
//
//  Created by Caio Cardozo on 27/07/23.
//

import UIKit
import SnapKit

final class HomeView: BaseView {
   
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = true
        tableView.showsHorizontalScrollIndicator = false
        tableView.separatorColor = .clear
        tableView.register(ComicTableViewCell.self, forCellReuseIdentifier: ComicTableViewCell.reuseIdentifier)
        return tableView
    }()
    
    override func addViews() {
        self.backgroundColor = .white
        self.addSubview(tableView)
    }
    override func addConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
