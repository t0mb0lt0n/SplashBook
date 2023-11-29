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
    
    static func HTTPRequestConfuguration(
        with tunnel: String,
        server: String,
        endPoint: String,
        method: HTTPMethod,
        headers: HTTPHeaders? = nil,
        parameters: HTTPParameters? = nil
    ) throws -> URLRequest {
//        guard let url = composeURL(with: tunnel, server: server, endPoint: endPoint) else {
//            throw NetworkFailure.URLEncoderError.encodingFailure
//        }
        print("passed")
        let url = URL(string: "")!
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
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

//    static func configureHTTPRequest(
//      from path: String,
//      baseUrl: String,
//      parameters: HTTPParameters? = nil,
//      headers: HTTPHeaders? = nil,
//      and method: HTTPMethod
//    ) throws -> URLRequest {
//      guard let url = URL(string: baseUrl + path) else {
//        throw HTTPNetworkError.missingURL
//
//      }
//      var request = URLRequest(
//        url: url, cachePolicy: .reloadIgnoringLocalCacheData,
//        timeoutInterval: timeoutInterval
//      )
//      request.httpMethod = method.rawValue
//      try configureParametersAndHeaders(
//        parameters: parameters,
//        headers: headers, request: &request
//      )
//      return request
//    }
}
