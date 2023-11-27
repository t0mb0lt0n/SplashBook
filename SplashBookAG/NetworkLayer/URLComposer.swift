//
//  URLComposer.swift
//  SplashBookAG
//
//  Created by Alexander on 27.11.2023.
//

import Foundation

struct URLComposer {
    static func composeParameters(
        for urlRequest: inout URLRequest,
        with parameters: HTTPParameters
    ) throws {
        if parameters == nil { return }
        guard let url = urlRequest.url,
              let existingParameters = parameters else {
                  //throw
            return
              }
    }
    
    
    
    
    
    
    
    
    
//    static func encodeParameters(
//        for urlRequest: inout URLRequest,
//        with parameters: HTTPParameters
//    ) throws {
//        if parameters == nil { return }
//        guard let url = urlRequest.url,
//              let unwrappedParameters = parameters else {
//            throw HTTPNetworkError.missingURL
//        }
//
//        if var urlComponents = URLComponents(
//            url: url, resolvingAgainstBaseURL: false
//        ),
//           !unwrappedParameters.isEmpty {
//            urlComponents.queryItems = [URLQueryItem]()
//
//            for (key,value) in unwrappedParameters {
//                let queryItem = URLQueryItem(name: key, value: "\(value)")
//                urlComponents.queryItems?.append(queryItem)
//            }
//            urlRequest.url = urlComponents.url
//        }
//    }
    
}
