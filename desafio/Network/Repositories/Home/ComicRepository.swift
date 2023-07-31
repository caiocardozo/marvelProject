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

    static func fetchDetails(success: @escaping (ComicsRequest) -> Void, error: @escaping (String) -> Void) {
        NetworkManager.shared.request(url, method: .post, encoding: URLEncoding.httpBody, headers: nil) {( response: Result<ComicsRequest, NetworkErrors>) in
            switch response {
            case .success(let data):
                success(data)
            case .failure(let e):
                error(e.localizedDescription)
            }
        }
    }
}

struct ComicsRequest: Codable {
    var attributionText: String?
    var data: ListDataComics
}

struct ListDataComics: Codable {
    var results: [ComicItem]?
}

