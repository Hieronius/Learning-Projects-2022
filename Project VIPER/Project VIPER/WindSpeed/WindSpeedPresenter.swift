

import Foundation

protocol WindSpeedPresenterProtocol: AnyObject {
    func viewDidLoaded()
}

class WindSpeedPresenter {
    weak var view: WindSpeedViewControllerProtocol?
    
    var interactor: WindSpeedInteractorProtocol
    var router: WindSpeedRouterProtocol
    
    init(interactor: WindSpeedInteractorProtocol, router: WindSpeedRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension WindSpeedPresenter: WindSpeedPresenterProtocol {
    
    func viewDidLoaded() {
        let wind = interactor.getImageCurrentWindSpeed()
        view?.showWindSpeed(wind: wind)
        
    }
}
