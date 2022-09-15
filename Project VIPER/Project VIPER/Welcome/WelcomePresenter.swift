// Gives data for user or accepting data from user

import Foundation

protocol WelcomePresenterProtocol: AnyObject {
    
}

class WelcomePresenter {
    weak var view: WelcomeViewProtocol?
    var router: WelcomeRouterProtocol
    var interactor: WelcomeInteractorProtocol
    
    init(interactor: WelcomeInteractorProtocol, router: WelcomRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension WelcomePresenter: WelcomePresenterProtocol {
    
}
