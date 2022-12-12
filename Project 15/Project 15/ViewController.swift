//
//  ViewController.swift
//  Project 15
//
//  Created by Арсентий Халимовский on 07.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView: UIImageView!
    var currentAnimation = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView = UIImageView(image: UIImage(named: "penguin"))
        imageView.center = CGPoint(x: 512, y: 384)
        view.addSubview(imageView)
        
        
        
    }

    @IBAction func tapped(_ sender: Any) {
    }
    

}

