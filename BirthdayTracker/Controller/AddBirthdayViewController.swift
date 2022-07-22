

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
        
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        print("My name is \(firstName) \(lastName).")
        
        let birthdate = birthdayPicker.date
        print("My birthday in \(birthdate).")
        
        let newBirthday = Birthday(firstName: firstName, lastName: lastName, birthdate: birthdate)
        print("Added new copy of birthdate")
        print("First Name: \(newBirthday.firstName)")
        print("Last Name: \(newBirthday.lastName)")
        print("Birthdate \(newBirthday.birthdate)")
    }


}



