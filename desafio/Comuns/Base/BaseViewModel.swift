//
//  BaseViewModel.swift
//  desafio
//
//  Created by Caio Cardozo on 28/07/23.
//

import RxSwift

class BaseViewModel {
    let error = PublishSubject<String>()
    let isLoading = PublishSubject<Bool>()
}
