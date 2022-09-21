//
//  ViewController.swift
//  AlertControllerApp
//
//  Created by Арсентий Халимовский on 20.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var hiLabel: UILabel!
    @IBOutlet var yoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showButton(_ sender: Any) {
        self.hiLabel.text = "Hi, "
        self.alert1(title: "Warning", message: "Write your name", style: .alert)
    }
    
    
    @IBAction func showButton2(_ sender: Any) {
        self.yoLabel.text = "Yo, "
        self.alert2(title: "Alert", message: "Write your nick-name", style: .alert)
    }
    
    func alert1(title: String, message: String, style: UIAlertController.Style) {
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
    
    func alert2(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in
            let text = alertController.textFields?.first
            self.yoLabel.text! += (text?.text!)! + "!"
        }
        let action2 = UIAlertAction(title: "What", style: .default) { (action) in
            let text = alertController.textFields?.first
            self.yoLabel.text! += (text?.text!)! + "?"
        }
        
        let action3 = UIAlertAction(title: "Kill ya", style: .default) { (action) in
            let text = alertController.textFields?.first
            self.yoLabel.text! += (text?.text!)! + "@"
        }
        
        alertController.addTextField { (textField) in
            textField.isSecureTextEntry = true
        }
        
        alertController.addAction(action3)
        alertController.addAction(action)
        alertController.addAction(action2)
        self.present(alertController, animated: true, completion: nil)
    }
}

