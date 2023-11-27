//
//  HTTPNetworkError.swift
//  SplashBookAG
//
//  Created by Alexander on 27.11.2023.
//

import Foundation

enum NetworkFailure {
    enum URLComposerError: String, Error {
        case missedURL = "Composer Error - Missed URL"
        case composingFailed = "Composer Error - Composing Failed"
        case missedHeaders = "Error - Missed Headers"
    }
    
    enum HTTPError: String, Error {
        case badRequest400 = "HTTP Error 400 - Bad Request"
        case requestTimeout408 = "HTTP Error 408 - Request Timeout"
        case notFoundClient404 = "HTTP Error 404 - Not Found (Client)"
        case methodNotAllowed405 = "HTTP Error 405 - Method Not Allowed"
        case internalServerError500 = "HTTP Error 500 - Internal Server Error"
        case badGateway502 = "HTTP Error 502 - Bad Gateway"
        case networkAuthRequired511 = "HTTP Error 511 - Network Authentication Required"
        case connectionTimeout599 = "HTTP Error 599 - Network Connection Timeout"
    }
}
