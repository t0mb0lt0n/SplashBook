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
//        guard var request = URLRequest(url: URL(string: "http")) else {
//            throw URLError.BadTunnel
//        }
       // let url = try composeURL(with: path, server: "", endPoint: "")
        
        do {
            guard let url = try composeURL(with: path, server: "", endPoint: "") else {
                throw URLError.BadTunnel
            }
            let request = URLRequest(url: url)
        
            return request
        } catch {
            print(error.localizedDescription)
            return URLRequest(url: URL(string: "")!)
        }
        //let request = URLRequest(url: url)
        
        //return request
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
}
