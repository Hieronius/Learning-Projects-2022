//
//  ViewController.swift
//  Project 18
//
//  Created by Арсентий Халимовский on 25.12.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        assert(myReallySlowMethod() == true, "The slow method returned false, which is s a bad thing")
        
    }


}

