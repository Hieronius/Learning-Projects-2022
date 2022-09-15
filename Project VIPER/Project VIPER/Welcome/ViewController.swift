// Module name "Welcome" because this module supposed to meet user

import UIKit

protocol WelcomeViewProtocol: AnyObject {
    
}

class ViewController: UIViewController {
    
    var presenter: WelcomePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

