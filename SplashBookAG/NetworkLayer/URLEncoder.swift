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
            }
            urlRequest.url = urlComponents.url
        }
    }
}
