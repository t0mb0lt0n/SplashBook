//
//  NetworkClient.swift
//  SplashBookAG
//
//  Created by Alexander on 01.12.2023.
//

import Foundation

final class NetworkClient {
    private var session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func downloadData<T: Decodable>(
        scheme: String,
        path: String,
        method:
    ) {}
    
    
    
    
}
