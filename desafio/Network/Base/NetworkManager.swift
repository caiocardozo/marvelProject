//
//  NetworkManager.swift
//  desafio
//
//  Created by Caio Cardozo on 30/07/23.
//

import UIKit
import Alamofire

class NetworkManager {
    static let shared: NetworkManager = {
        return NetworkManager()
    }()
    
    var request: Alamofire.Request?
    
    func request<T: Codable>(_ url: String, method: HTTPMethod = .get, parameters: Parameters? = nil, encoding: ParameterEncoding = URLEncoding.queryString, headers: HTTPHeaders? = nil, interceptor: RequestInterceptor? = nil, completion: @escaping (Result<T, NetworkErrors>) -> Void) {
        debugPrint(url)
        if NetworkReachabilityManager()?.isReachable == true {
            AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
                .validate(statusCode: 200..<500)
                .responseJSON(completionHandler: { (response) in
                    switch response.result {
                    case .success(let data):
                        switch response.response?.statusCode {
                        case 200, 204:
                            do {
                                let result = try JSONDecoder().decode(T.self, from: JSONSerialization.data(withJSONObject: data))
                                debugPrint(result)
                                completion(.success(result))
                            } catch _ {
                                debugPrint("Falhou no decode do objeto")
                                completion(.failure(.serverMessage("Erro ao obter resposta")))
                            }
                        default:
                            if JSONSerialization.isValidJSONObject(data) {
                                do {
                                    let result = try JSONDecoder().decode(ErrorResponse.self, from: JSONSerialization.data(withJSONObject: data))
                                    completion(.failure(.customServerMessage(result)))
                                } catch let error {
                                    completion(.failure(.serverMessage(error.localizedDescription)))
                                }
                            } else {
                                if let string = data as? String {
                                    completion(.failure(.serverMessage(string)))
                                } else {
                                    completion(.failure(.genericError))
                                }
                            }
                        }
                    case .failure(let error):
                        completion(.failure(error.responseCode == 401 ? .genericError : .serverMessage(error.localizedDescription)))
                    }
                })
        } else {
            completion(.failure(.noConnection))
        }
    }
}
