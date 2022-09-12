

import Foundation

func fetchMailTest() {
    

let headers = ["Accept": "application/json"]

let request = NSMutableURLRequest(url: NSURL(string: "https://api.kickbox.com/v2/verify?email=Aas2asd2ad1w@gmail.com&apikey=\(apiKey)")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)

request.httpMethod = "GET"
request.allHTTPHeaderFields = headers

let session = URLSession.shared
let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
    if (error != nil) {
        print(error as Any)
    } else {
        let httpResponse = response as? HTTPURLResponse
        print(httpResponse)
    }
}
    dataTask.resume()
}
