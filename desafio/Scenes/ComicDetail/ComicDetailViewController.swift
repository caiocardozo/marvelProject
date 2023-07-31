//
//  ComicDetailViewController.swift
//  desafio
//
//  Created by Caio Cardozo on 30/07/23.
//

import UIKit
import RxSwift

final class ComicDetailViewController: UIViewController, HasCustomView {
    // MARK: - Typealias
    typealias CustomView = ComicDetailView
    private var comicItem: ComicItem
    // MARK: - Init
    init(comicItem: ComicItem) {
        self.comicItem = comicItem
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        let customView = CustomView()
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        loadCustomCloseButton(action: #selector(close))
        setupViews()
    }
    // MARK: - Setup
    private func setupViews() {
        customView.setup(comicItem: comicItem)
    }
    
    // MARK: - Actions
    @objc func close() {
        self.navigationController?.dismiss(animated: true)
    }
}
    // MARK: - Show
    extension ComicDetailViewController {
        static func show(in host: UIViewController, comicItem: ComicItem) {
            let alert = ComicDetailViewController(comicItem: comicItem)
            let nav = UINavigationController(rootViewController: alert)
            nav.modalPresentationStyle = .fullScreen
            host.present(nav, animated: true, completion: nil)
        }
    }
