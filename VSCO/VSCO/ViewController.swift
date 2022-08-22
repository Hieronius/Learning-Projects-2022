//
//  ViewController.swift
//  VSCO
//
//  Created by Арсентий Халимовский on 21.08.2022.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate {
    
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var picture: UIImageView!
    
    private var imagePicker: ImagePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        // Do any additional setup aft  er loading the view.
    }

    
    @IBAction func editAction(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Editor", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Editor") as! EditorViewController
        vc.picture = self.picture.image
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func addAction(_ sender: Any) {
        
        self.imagePicker.present(from: sender as! UIView)
    }
    
}

extension ViewController: ImagePickerDelegate {
    
    func didSelect(image: UIImage?) {
        self.picture.image = image
    }
}
