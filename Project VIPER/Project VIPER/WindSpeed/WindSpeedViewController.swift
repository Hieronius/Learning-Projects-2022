

import Foundation
import UIKit

protocol WindSpeedViewControllerProtocol: AnyObject {
    func showWindSpeed(wind: UIImage?)
}

class WindSpeedViewController: UIViewController {
    
    @IBOutlet var wind: UIImageView!
    
    
    // MARK: Public
    
    var presenter: WindSpeedPresenterProtocol?
    
    
    // MARK: View lifecicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoaded()
        initialize()
        
    }
    
    
    // MARK: Private functions:
    
    private func initialize() {
        
    }
    
}
    // MARK: WindSpeedViewControllerProtocol:
    
    extension WindSpeedViewController: WindSpeedViewControllerProtocol {
         func showWindSpeed(wind: UIImage?) {
             DispatchQueue.main.async {
                 self.wind.image = wind
             }
        }
    }

