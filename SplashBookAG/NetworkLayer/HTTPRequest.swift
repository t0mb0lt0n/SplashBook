//
//  HTTPRequest.swift
//  SplashBookAG
//
//  Created by Alexander on 08.11.2023.
//

import Foundation

typealias HTTPHeaders = [String: Any]?
typealias HTTPParameters = [String: Any]?

struct HTTPRequest {
    static let timeOutInterval = 5.0
    
    static func configureURLRequest(
        with tunnel: String,
        server: String,
        endPoint: String,
        method: HTTPMethod,
        headers: HTTPHeaders? = nil,
        parameters: HTTPParameters? = nil
    ) throws -> URLRequest {
        guard let url = URL(string: tunnel + server + endPoint) else {
            throw NetworkFailure.URLEncoderError.missedURL
        }
        var request = URLRequest(
            url: url,
            cachePolicy: .reloadIgnoringLocalCacheData,
            timeoutInterval: timeOutInterval
        )
        request.httpMethod = method.rawValue
        
        try composeParametersAndHeaders(
            parameters: parameters,
            headers: headers,
            for: &request
        )
        return request
    }
    
    static func composeParametersAndHeaders(
        parameters: HTTPParameters?,
        headers: HTTPHeaders?,
        for request: inout URLRequest
    ) throws {
        do {
            if let parameters = parameters {
                try URLEncoder.encodeURLParameters(from: &request, with: parameters)
            }
            if let headers = headers {
                try URLEncoder.setHeaders(from: &request, with: headers)
            }
        } catch {
            throw NetworkFailure.URLEncoderError.encodingFailure
        }
    }

}
