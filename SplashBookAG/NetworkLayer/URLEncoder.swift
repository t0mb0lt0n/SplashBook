//
//  URLEncoder.swift
//  SplashBookAG
//
//  Created by Alexander on 09.11.2023.
//

import Foundation

struct URLEncoder {
    static func encodeURLComponents(from url: URL) -> URLComponents {
        guard let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else { return }
        return urlComponents
    }
}
