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
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        do {
            let request = try HTTPRequest.configureURLRequest(
                with: scheme,
                host: host,
                path: path,
                method: .get,
                headers: nil,
                parameters: parameters
            )
            execute(with: request, completion: completion)
        } catch {
            completion(.failure(NetworkFailure.HTTPError.badRequest400))
        }
    }
    
    func execute<T: Decodable>(
        with request: URLRequest,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        self.session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                }
                if let data = data {
                    print(data)
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                    do {
                        let decodedData = try jsonDecoder.decode(T.self, from: data)
                        completion(.success(decodedData))
                    } catch {
                        completion(.failure(NetworkFailure.JSONDecoderError.decodingFailure))
                    }
                }
            }
        }
        .resume()
    }
    
    func decode<T: Decodable>(_ data: Data) -> T? {
        try? JSONDecoder().decode(T.self, from: data)
    }
}
