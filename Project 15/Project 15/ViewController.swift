//
//  ViewController.swift
//  Project 15
//
//  Created by Арсентий Халимовский on 07.12.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("test commit")
        print("another test commit")
        print("test commit 10.12.22")
        print("test commit 11.12.22")
        
        factorial(a: 200)
    }

    func factorial(a: Int) -> Int {
        let n = a
        if n == 1 {
            return 1
        } else {
            return n * factorial(a: n - 1)
        }
    }

}

