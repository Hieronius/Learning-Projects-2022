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
    }

    private func makeRequest() {
        var request = URLRequest(url: URL(string: "https://v2.jokeapi.dev/joke/Any")!)
        
        let task = URLSession.shared.dataTask(with: request) {
    }

}

