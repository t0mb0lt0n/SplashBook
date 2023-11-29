//
//  URLEncoder.swift
//  SplashBookAG
//
//  Created by Alexander on 09.11.2023.
//

import Foundation

struct URLEncoder {
    static func encodeURLParameters(
        from urlRequest: inout URLRequest,
        with parameters: HTTPParameters
    ) throws {
        if parameters == nil { return }
        guard let url = urlRequest.url,
              let safeUnwrappedParameters = parameters
        else {
            throw NetworkFailure.URLEncoderError.missedURL
        }
        
        if var urlComponents = URLComponents(
            url: url,
            resolvingAgainstBaseURL: false
        ),
           !safeUnwrappedParameters.isEmpty {
            urlComponents.queryItems = [URLQueryItem]()
            
            for (key, value) in safeUnwrappedParameters {
                let queryItem = URLQueryItem(name: key, value: value as? String)
                urlComponents.queryItems?.append(queryItem)
                print(urlComponents.url)
            }
            urlRequest.url = urlComponents.url
        }
    }
    
    static func setHeaders(
        from urlRequest: inout URLRequest,
        with headers: HTTPHeaders
    ) throws {
        if headers == nil { return }
        guard let unwrappedHeaders = headers else {
           throw NetworkFailure.URLEncoderError.missedHeaders
        }
        
        for (key, value) in unwrappedHeaders {
            urlRequest.setValue(key, forHTTPHeaderField: "\(value)")
            //urlRequest.setValue(key, forHTTPHeaderField: value as! String)
        }
    }
}
