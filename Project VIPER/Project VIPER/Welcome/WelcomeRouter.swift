// Navigation module

import Foundation

protocol WelcomeRouterProtocol: AnyObject {
    func openImage(for temperature: Int)
    func openWindSpeed(for wind: Int)
}

class WelcomeRouter: WelcomeRouterProtocol {
    weak var viewController: ViewController?
    
    func openImage(for temperature: Int) {
        let vc = ImageViewerModuleBuilder.build(temperature: temperature)
        viewController?.present(vc, animated: true, completion: nil)
    }
    
    func openWindSpeed(for wind: Int) {
        let vc = WindSpeedModuleBuilder.build(wind: wind)
        viewController?.present(vc, animated: true, completion: nil)
    }
    
    func openPressure(for pressure: Int) {
        let vc = PressureModuleBuilder.build(pressure: pressure)
        viewController?.present(vc, animated: true, completion: nil)
    }
}

