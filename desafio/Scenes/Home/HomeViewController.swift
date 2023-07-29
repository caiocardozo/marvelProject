//
//  HomeViewController.swift
//  desafio
//
//  Created by Caio Cardozo on 27/07/23.
//

import UIKit
import RxSwift

final class HomeViewController: UIViewController, HasCustomView {
    // MARK: - Typealias
    typealias CustomView = HomeView
    var viewModel = HomeViewModel()
    private let disposeBag = DisposeBag()
    
    // MARK: - Lifecycle
    override func loadView() {
        let customView = CustomView()
        view = customView
    }
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupObservable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadData()
    }
    
    // MARK: - Setup
    private func setupTableView() {
        viewModel.comicsList.asObservable().bind(to: self.customView.tableView.rx.items(cellIdentifier: ComicTableViewCell.reuseIdentifier, cellType: ComicTableViewCell.self)) { _, model, cell in
            cell.setup(comicItem: model)
        }.disposed(by: self.disposeBag)
    }
    
    private func setupObservable() {
        viewModel.isLoading
            .subscribe(onNext: { [weak self] isLoading in
                guard let self = self else { return }
                self.setLoader(loading: isLoading)
            }).disposed(by: disposeBag)
        
        viewModel.error.subscribe(onNext: { [weak self] message in
            guard let self = self else { return }
            self.showErrorAlert(title: "Erro", message: message)
        }).disposed(by: disposeBag)
        
    }
}
