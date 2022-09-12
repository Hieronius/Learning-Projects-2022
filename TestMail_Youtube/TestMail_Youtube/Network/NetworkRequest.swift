

import Foundation

class NetworkRequest {
    
    static let shared = NetworkRequest()
    private init() {}
    
    func requestData(verifiableMail: String, completion: @escaping(Result<Data, Error>) -> Void) {
        
        // let urlString = "https://api.kickbox.com/v2/verify?email=\(verifiableMail)&apikey=\(apiKey)"
        let urlString = "https://api.debounce.io/v1/?api=\(apiKeySecond)&email=\(verifiableMail)"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                completion(.success(data))
                print(response)
                print("We are done")
            }
        }
        .resume()
        
        
    }
}
