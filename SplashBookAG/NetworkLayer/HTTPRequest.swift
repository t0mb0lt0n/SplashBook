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
        let request = URLRequest(url: URL(string: "")!)
        return request
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
        let finalURL = URL(string: tunnel + server + endPoint)
        return finalURL
    }
}
