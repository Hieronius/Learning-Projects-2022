

import UIKit
import Foundation

class AddBirthdayViewController: UIViewController {

    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var birthdayPicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        birthdayPicker.maximumDate = Date()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        print("Нажата кнопка сохранени")
    }


}



