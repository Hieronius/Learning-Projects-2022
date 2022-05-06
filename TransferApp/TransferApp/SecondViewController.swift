import UIKit


class SecondViewController: UIViewController {
    
    // ...
    @IBOutlet var dataTextField: UITextField!
    
    var updatingData: String = " "
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTextFieldData(withText: updatingData)
    }
    
    // обновляем данные в текстовом поле
    private func updateTextFieldData(withText text: String) {
        dataTextField.text = text
    }
}
