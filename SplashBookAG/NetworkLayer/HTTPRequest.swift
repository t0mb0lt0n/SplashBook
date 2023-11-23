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
        
        
        
        
        
    }
    
    private static func composeURL(
        with path: String,
        
    
    ) throws -> URL
}
