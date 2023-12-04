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
    
    func execute<T: Decodable>(
        with request: URLRequest,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        DispatchQueue.global(qos: .background).async {
            self.session.dataTask(with: request) { data, response, error in
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    let decodedData = try jsonDecoder.decode(T, from: data)
                    completion(.success(decodedData))
                }
                
            }
        }
        
    }
    
    
}
