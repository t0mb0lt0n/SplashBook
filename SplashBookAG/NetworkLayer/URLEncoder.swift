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
        guard let url = urlRequest.url else {
            throw NetworkFailure.URLEncoderError.missedURL
        }
        
    }
}
