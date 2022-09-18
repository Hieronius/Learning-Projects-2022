

import Foundation
import UIKit

protocol WindSpeedViewControllerProtocol {
    func showWindSpeed(image: UIImage?)
}

class WindSpeedViewController: ViewController {
    
    @IBOutlet var windSpeed: UIImageView!
    
    
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
         func showWindSpeed(image: UIImage?) {
             DispatchQueue.main.async {
                 self.windSpeed.image = image
             }
        }
    }

