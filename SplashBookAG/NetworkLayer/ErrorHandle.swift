
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
