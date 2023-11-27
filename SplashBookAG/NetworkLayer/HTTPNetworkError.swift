//
//  HTTPNetworkError.swift
//  SplashBookAG
//
//  Created by Alexander on 27.11.2023.
//

import Foundation

enum HTTPNetworkError: String, Error {
    case badRequest400 = "HTTP Error 400 - Bad Request"
    case requestTimeout408 = "HTTP Error 408 - Request Timeout"
    case notFoundClient404 = "HTTP Error 404 - Not Found (Client)"
    case methodNotAllowed405 = "HTTP Error 405 - Method Not Allowed"
    case internalServerError500 = "HTTP Error 500 - Internal Server Error"
    
    
}
