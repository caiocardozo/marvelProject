//
//  ComicRepository.swift
//  desafio
//
//  Created by Caio Cardozo on 30/07/23.
//

import Alamofire
import Foundation

class ComicRepository {

    static let url = "https://gateway.marvel.com/v1/public/comics?apikey=b7e14bab409c70a5c4e7c2b319c09d7b&ts=1682982412&hash=3482f01e9bf207a437a4b621c91339ad"

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

