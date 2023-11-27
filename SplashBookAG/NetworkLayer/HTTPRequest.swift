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
        guard let url = composeURL(with: tunnel, server: server, endPoint: endPoint) else {
            throw HTTPNetworkError.urlComposingError
        }
        print("passed")
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        //request.
        return request
    }
    
    static func composeURL(
        with tunnel: String,
        server: String,
        endPoint: String
    ) -> URL? {
        let composedURL = URL(string: tunnel + server + endPoint)
        print(composedURL)
        return composedURL
    }

    static func configureHTTPRequest(
      from path: String,
      baseUrl: String,
      parameters: HTTPParameters? = nil,
      headers: HTTPHeaders? = nil,
      and method: HTTPMethod
    ) throws -> URLRequest {
      guard let url = URL(string: baseUrl + path) else {
        throw HTTPNetworkError.missingURL

      }
      var request = URLRequest(
        url: url, cachePolicy: .reloadIgnoringLocalCacheData,
        timeoutInterval: timeoutInterval
      )
      request.httpMethod = method.rawValue
      try configureParametersAndHeaders(
        parameters: parameters,
        headers: headers, request: &request
      )
      return request
    }
}
