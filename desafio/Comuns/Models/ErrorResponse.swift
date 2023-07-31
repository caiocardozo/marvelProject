//
//  ErrorResponse.swift
//  desafio
//
//  Created by Caio Cardozo on 30/07/23.
//

import Foundation

struct ErrorResponse: Codable {
    var message: String?
    var code: String?
    var errors: String?
}
