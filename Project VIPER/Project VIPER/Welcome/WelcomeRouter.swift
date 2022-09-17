// Navigation module

import Foundation

protocol WelcomeRouterProtocol: AnyObject {
    func openImage(for temperature: Int)
}

class WelcomeRouter: WelcomeRouterProtocol {
    weak var viewController: ViewController?
    
    func openImage(for temperature: Int) {
        let vc = ImageViewerModuleBuilder.build(temperature: temperature)
        viewController?.present(vc, animated: true, completion: nil)
    }
}

