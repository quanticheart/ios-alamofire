//
//  NetworkError.swift
//  alamofire
//
//  Created by Jonn Alves on 11/03/23.
//

import Foundation
import Alamofire

struct BackendError: Codable, Error {
    var status: String
    var message: String
}
