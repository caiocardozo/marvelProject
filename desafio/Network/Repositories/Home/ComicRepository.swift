//
//  ComicRepository.swift
//  desafio
//
//  Created by Caio Cardozo on 30/07/23.
//

import Alamofire
import Foundation

class ComicRepository {

    static let url = ApiUrlBase.baseUrl + ApiComicUrl.comics

    static func fetchComic(success: @escaping (ComicsRequest) -> Void, error: @escaping (String) -> Void) {
        NetworkManager.shared.request(url, headers: nil) {( response: Result<ComicsRequest, NetworkErrors>) in
            switch response {
            case .success(let data):
                success(data)
            case .failure(let e):
                error(e.localizedDescription)
            }
        }
    }
}

