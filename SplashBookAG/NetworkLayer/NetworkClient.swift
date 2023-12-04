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
        host: String,
        path: String,
        parameters: HTTPParameters,
        comletion: @escaping (Result<T, Error>) -> Void
    ) {
        do {
            let request = try HTTPRequest.configureURLRequest(
                with: scheme,
                host: host,
                path: path,
                method: .get
            )
            
        } catch {
            comletion(.failure(NetworkFailure.HTTPError.badRequest400))
        }
        
    }
    
    
    
    func execute() {
        
    }
    
    
}
