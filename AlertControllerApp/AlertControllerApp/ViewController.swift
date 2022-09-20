//
//  ViewController.swift
//  AlertControllerApp
//
//  Created by Арсентий Халимовский on 20.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var hiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showButton(_ sender: Any) {
        self.hiLabel.text = "Hi, "
        self.alert(title: "Warning", message: "Write your name", style: .alert)
    }
    
    func alert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in
            let text = alertController.textFields?.first
            self.hiLabel.text! += (text?.text!)! + "!"
        }
        
        alertController.addTextField { (textField) in
            textField.isSecureTextEntry = true
        }
        
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

