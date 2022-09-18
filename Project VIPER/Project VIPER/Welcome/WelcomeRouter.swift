// Navigation module

import Foundation

protocol WelcomeRouterProtocol: AnyObject {
    func openImage(for temperature: Int)
    func openWindSpeed(for windSpeed: Int)
}

class WelcomeRouter: WelcomeRouterProtocol {
    weak var viewController: ViewController?
    
    func openImage(for temperature: Int) {
        let vc = ImageViewerModuleBuilder.build(temperature: temperature)
        viewController?.present(vc, animated: true, completion: nil)
    }
    
    func openWindSpeed(for windSpeed: Int) {
        let vc = WindSpeedModuleBuilder.build(windSpeed: windSpeed)
        viewController?.present(vc, animated: true, completion: nil)
    }
}

