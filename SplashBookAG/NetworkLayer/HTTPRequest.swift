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
        with path: String,
        method: HTTPMethod,
        initialURL: String,
        headers: HTTPHeaders? = nil,
        parameters: HTTPParameters? = nil
    ) throws -> URLRequest {
        do {
            guard let url = try composeURL(with: "https://", server: "randomuser.me", endPoint: "/api") else {
                throw URLError.BadEndPoint
            }
            print("passed")
            let request = URLRequest(url: url)
            return request
        } catch {
            print(error.localizedDescription)
            return URLRequest(url: URL(string: "https://")!)
        }
    }
    
    static func composeURL(
        with tunnel: String?,
        server: String?,
        endPoint: String?
    ) throws -> URL? {
        guard let tunnel else {
            throw URLError.BadTunnel
        }
        guard let server else {
            throw URLError.BadServer
        }
        guard let endPoint else {
            throw URLError.BadEndPoint
        }
        let composedURL = URL(string: tunnel + server + endPoint)
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
