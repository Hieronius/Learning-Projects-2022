

import Foundation
import UIKit


enum ApiType {
    
    case login
    case getUsers
    case getPosts
    case getAlbums
    
    var baseURL: String {
        return "https://jsonplaceholder.typicode.com/"
    }
    
    var headers: [String: String] {
        switch self {
        case .login:
            return ["authToken": "12345"]
        default:
            return [:]
        }
    }
    
    var path: String {
        switch self {
        case .login: return "login"
        case .getUsers: return "users"
        case .getPosts: return "posts"
        case .getAlbums: return "albums"
        }
    }
    
    var request: URLRequest {
        var url = URL(string: path, relativeTo: URL(string: baseURL)!)!
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        switch self {
        case .login:
            request.httpMethod = "POST"
            return request
        default:
            request.httpMethod = "GET"
            return request
        }
    }
}


class ApiManager {
    
    static let shared = ApiManager()
    
    func getUsers(completion: @escaping (Users) -> Void) {
        
        var request = ApiType.getUsers.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            print(data?.count))
        }
        task.resume()
}

}
