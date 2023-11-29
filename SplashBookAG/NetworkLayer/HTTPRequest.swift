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
    static let timeOutInterval = 5
    
    static func composeHTTPRequest(
        with tunnel: String,
        server: String,
        endPoint: String,
        method: HTTPMethod,
        headers: HTTPHeaders? = nil,
        parameters: HTTPParameters? = nil
    ) throws -> URLRequest {
        
       
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
