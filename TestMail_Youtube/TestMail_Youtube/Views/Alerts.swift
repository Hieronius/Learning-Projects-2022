

import Foundation
import UIKit

struct Alert {
    
    private static func showSimpleAlert(vc: UIViewController, title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(ok)
        DispatchQueue.main.async {
            vc.present(alertController, animated: true, completion: nil)
        }
    }
    
    static func showResultAlert(vs: UIViewController, message: String) {
        
    }
}
