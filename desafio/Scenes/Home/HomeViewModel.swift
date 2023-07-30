//
//  HomeViewModel.swift
//  desafio
//
//  Created by Caio Cardozo on 27/07/23.
//

import RxSwift
import RxCocoa

final class HomeViewModel: BaseViewModel {
    
    // MARK: - Properts
    private let disposeBag = DisposeBag()
    let comicsList = BehaviorRelay<[ComicItem]>(value: [])
    var providedBy = BehaviorRelay<String>(value: "")
    
    func loadData() {
        self.isLoading.onNext(true)
        fetchMarvelData { providedBy, comicList in
            self.isLoading.onNext(false)
            self.providedBy.accept(providedBy ?? "")
            self.comicsList.accept(comicList)
        }
    }
}
