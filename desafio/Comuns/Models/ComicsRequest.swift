//
//  ComicsRequest.swift
//  desafio
//
//  Created by Caio Cardozo on 30/07/23.
//

import Foundation

struct ComicsRequest: Codable {
    var attributionText: String?
    var data: ListDataComics
}

struct ListDataComics: Codable {
    var results: [ComicItem]?
}

struct PhotoComic: Codable {
    var pathImg: String
    var extensionImg: String
    
    enum CodingKeys: String, CodingKey {
        case pathImg = "path"
        case extensionImg = "extension"
    }
}
