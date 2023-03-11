//
//  NetworkExt.swift
//  alamofire
//
//  Created by Jonn Alves on 11/03/23.
//

import Foundation
import Alamofire
import Combine

extension Request {
    public func debugLog() -> Self {
#if DEBUG
        debugPrint(self)
        let body = request.flatMap { $0.httpBody.map { String(decoding: $0, as: UTF8.self) } } ?? "None"
        let message = """
       ⚡️ Request Started: \(request)
       ⚡️ Body Data: \(body)
       """
        NSLog(message)
#endif
        return self
    }
}
