//
//  HomeView.swift
//  desafio
//
//  Created by Caio Cardozo on 27/07/23.
//

import UIKit
import SnapKit

final class HomeView: BaseView {
   
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = true
        tableView.showsHorizontalScrollIndicator = false
        tableView.register(ComicTableViewCell.self, forCellReuseIdentifier: ComicTableViewCell.reuseIdentifier)
        return tableView
    }()
    
    private lazy var provideByLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 10.0)
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    override func addViews() {
        self.backgroundColor = .white
        self.addSubview(tableView)
        self.addSubview(provideByLabel)
    }
    override func addConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
        }
        provideByLabel.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom).inset(-12)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
    
    func setupProviderBy(provideBy: String?) {
        if provideBy == "" {
            
        } else {
            DispatchQueue.main.async {
                self.provideByLabel.text = provideBy
            }
        }
    }
}
