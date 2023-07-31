//
//  NetworkErrors.swift
//  desafio
//
//  Created by Caio Cardozo on 30/07/23.
//

import Foundation

enum NetworkErrors: Error {
    case authError
    case genericError
    case invalidUrl
    case noConnection
    case serverMessage(_ message: String)
    case customServerMessage(_ error: ErrorResponse)
}

extension NetworkErrors: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .genericError:
            return "Ocorreu um erro. Por favor, tente novamente."
        case .authError:
            return NSLocalizedString("", comment: "")
        case .invalidUrl:
            return  NSLocalizedString("Url Inválida", comment: "")
        case .noConnection:
            return "A conexão com a Internet parece estar off-line"
        case .serverMessage(let message):
            return message
        case .customServerMessage(let error):
            return error.message
        }
    }
}
