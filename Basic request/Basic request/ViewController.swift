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
        makeRequest()
        // Do any additional setup after loading the view.
    }

    private func makeRequest() {
        var request = URLRequest(url: URL(string: "https://api.chucknorris.io/jokes/random")!)
        
        let task = URLSession.shared.dataTask(with: request) {data, respone, error in
            
            print(String(decoding: data!, as: UTF8.self))
            print(error)
        }
        task.resume()
    }

}

