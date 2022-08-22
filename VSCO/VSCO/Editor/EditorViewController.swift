//
//  EditorViewController.swift
//  VSCO
//
//  Created by Арсентий Халимовский on 22.08.2022.
//

import UIKit

class EditorViewController: UIViewController {
    
    public var picture: UIImage?
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.image = picture

        // Do any additional setup after loading the view.
    }
    
    @IBAction func action1(_ sender: Any) {
    }
    
    @IBAction func action2(_ sender: Any) {
    }
    
    @IBAction func action3(_ sender: Any) {
    }
    
    @IBAction func action4(_ sender: Any) {
    }
    
    @IBAction func action5(_ sender: Any) {
    }
    
    
}
