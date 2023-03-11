//
//  Service.swift
//  alamofire
//
//  Created by Jonn Alves on 11/03/23.
//

import Foundation
import Combine
import Alamofire

class AmiiboRepository {
    static let shared: AmiiboProtocol = AmiiboRepository()
    private init() { }
}

extension AmiiboRepository: AmiiboProtocol {
    func fetchAmiibos() -> AnyPublisher<DataResponse<AmiiboResponse, NetworkError>, Never> {
        let url = URL(string: "https://www.amiiboapi.com/api/amiibo/")!
        
        let parameters = [
            "q": "test",
        ] as [String : Any]
        
        let headers: HTTPHeaders = [
            "Accept": "application/json"
        ]
        
        return AF.request(
            url,
            method: .get,
            parameters: parameters,
            headers: headers
        )
        .debugLog()
        .validate()
        .publishDecodable(type: AmiiboResponse.self)
        
        .map { response in
            debugPrint(response)
            return  response.mapError { error in
                let backendError = response.data.flatMap { try? JSONDecoder().decode(BackendError.self, from: $0)}
                return NetworkError(initialError: error, backendError: backendError)
            }
            
        }
        
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}



