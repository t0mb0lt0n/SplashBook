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
            guard let url = try composeURL(with: path, server: "test server", endPoint: "test endPOint") else {
                throw URLError.BadTunnel
            }
            print("passed")
            let request = URLRequest(url: url)
            return request
        } catch {
            print(error.localizedDescription)
            return URLRequest(url: URL(string: "")!)
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
        print(composedURL)
        return composedURL
    }
}
