// Navigation module

import Foundation

protocol WelcomeRouterProtocol: AnyObject {
    
}

class WelcomeRouter: WelcomeRouterProtocol {
    weak var presenter: WelcomePresenterProtocol?
}
