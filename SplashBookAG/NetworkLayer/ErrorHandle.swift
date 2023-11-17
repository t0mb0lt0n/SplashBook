//
//  ErrorHandle.swift
//  SplashBookAG
//
//  Created by Alexander on 17.11.2023.
//

import Foundation

enum HttpError: Error {
    case notFound404
    case serverError500
    case badrequest400
}

class NetworkManager {
    func fetchData(_ data: String?) throws -> Int{
        guard let data, !data.isEmpty else {
            throw HttpError.serverError500
        }
        
        guard !data.isEmpty else {
            throw HttpError.notFound404
        }
        
        guard data != "data" else {
            throw HttpError.badrequest400
        }
        print(data)
        return 0
    }
}

let manager = NetworkManager()

do {
    try manager.fetchData("passed")
} catch let error as HttpError {
    switch error {
    case .serverError500:
        print("server error")
    case .notFound404:
        print("server not found")
    case .badrequest400:
        print("bad request")
    }
}




let manager = NetworkManager()

do {
    try manager.fetchData("data passed")
} catch let error as HttpError {
    switch error {
    case .serverError500:
        print("server error")
    case .notFound404:
        print("server not found")
    case .badrequest400:
        print("bad request")
    }
}
