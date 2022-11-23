//
//  ViewController.swift
//  Project 13
//
//  Created by Арсентий Халимовский on 23.11.2022.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var intensity: UISlider!
    
    var currentImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Instafilter"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(importPicture))
    }
    
    @objc func importPicture() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }

    @IBAction func changeFilter(_ sender: Any) {
    }
    
    @IBAction func save(_ sender: Any) {
    }
    
    @IBAction func intensityChanged(_ sender: Any) {
    }
    
}

