

import Foundation

class NetworkRequest {
    
    static let shared = NetworkRequest()
    private init() {}
    
    func requestData(verifiableMail: String, completion: @escaping(Result<Data, Error>) -> Void) {
        
        
    }
}
