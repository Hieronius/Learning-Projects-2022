//
//  ViewController.swift
//  CoreImageTutorial
//
//  Created by Арсентий Халимовский on 26.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let arrayOfFilters = ["CISepiaTone", "CIPixellate", "CIGaussianBlur"]
    var image: UIImage!
    var tempArray: [String]!
    

    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tempArray = arrayOfFilters
        let startImage = UIImage(named: "agentsOfShield")
        imageView.image = startImage
    }

    @IBAction func filterIt(_ sender: Any) {
    }
    
}

