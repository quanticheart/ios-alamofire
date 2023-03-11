//
//  NetworkError.swift
//  alamofire
//
//  Created by Jonn Alves on 11/03/23.
//

import Foundation
import Alamofire

struct NetworkError: Error {
  let initialError: AFError
  let backendError: BackendError?
}
