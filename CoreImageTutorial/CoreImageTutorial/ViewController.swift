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
        let startImage = UIImage(named: "1")
        imageView.image = startImage
    }

    @IBAction func filterIt(_ sender: Any) {
        
        if tempArray.count == 0 {
            let startImage = UIImage(named: "1")
            imageView.image = startImage
            tempArray = arrayOfFilters
            tempArray.removeFirst()
    } else {
        let fileURL = Bundle.main.url(forResource: "1", withExtension: "png")
        let startImage = CIImage(contentsOf: fileURL!)
        
        let filter = CIFilter(name: tempArray.removeFirst())
        filter?.setValue(startImage, forKey: kCIInputImageKey)
        
        let newImage = UIImage(ciImage: (filter?.outputImage)!)
        self.imageView.image = newImage
        
        
    }
}
}

