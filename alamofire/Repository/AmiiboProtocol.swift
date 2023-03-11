//
//  ServiceProtocol.swift
//  alamofire
//
//  Created by Jonn Alves on 11/03/23.
//

import Foundation
import Alamofire
import Combine


protocol AmiiboProtocol {
    func fetchAmiibos() -> AnyPublisher<DataResponse<AmiiboResponse, NetworkError>, Never>
}
