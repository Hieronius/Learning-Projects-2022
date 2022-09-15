// Navigation module

import Foundation

protocol WelcomeRouterProtocol: AnyObject {
    
}

class WelcomeRouter: WelcomePresenter {
    weak var presenter: WelcomePresenterProtocol?
}
