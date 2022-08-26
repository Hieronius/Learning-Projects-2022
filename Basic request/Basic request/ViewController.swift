//
//  ViewController.swift
//  Basic request
//
//  Created by Арсентий Халимовский on 23.08.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ApiManager.shared.getPosts { posts in
            // do something with posts
        }
        ApiManager.shared.getAlbums { albums in
            // do something with albums
        }
    }

    

}


/*
 private func makeRequest() {
 var request = URLRequest(url: URL(string: "https://v2.jokeapi.dev/joke/Any")!)
 request.allHTTPHeaderFields = ["authToken": "nil"]
 request.httpMethod = "GET"
 
 let task = URLSession.shared.dataTask(with: request) {data, respone, error in
     
     if let data = data, let joke = try? JSONDecoder().decode(Joke.self, from: data) {
         
         print(joke.flags.racist)
     }
 }
 task.resume()
}
*/
