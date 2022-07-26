

import UIKit

protocol AddBirthdayViewControllerDelegate {
    
    func addBirthdayViewController(_ addBirthdayViewController: AddBirthdayViewController, didAddBirthday birthday: Birthday)
}

class AddBirthdayViewController: UIViewController {

    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var birthdatePicker: UIDatePicker!
    
    
    var delegate: AddBirthdayViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        birthdatePicker.maximumDate = Date()
        
    }
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        
        
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        
        
        let birthdate = birthdatePicker.date
        
        let newBirthday = Birthday(firstName: firstName, lastName: lastName, birthdate: birthdate)
        
        print("Record about new birthday is created")
        print("First name: \(newBirthday.firstName)")
        print("Last name: \(newBirthday.lastName)")
        print("Birthdate: \(newBirthday.birthdate)")
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }


}

