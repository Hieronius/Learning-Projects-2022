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
    


}
