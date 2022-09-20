//
//  ViewController.swift
//  AlertControllerApp
//
//  Created by Арсентий Халимовский on 20.09.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Error", message: "Ahtung", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in
            let text = alertController.textFields?.first?.text
            print(text ?? "nil text")
        }
        
        alertController.addTextField(configurationHandler: nil)
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

