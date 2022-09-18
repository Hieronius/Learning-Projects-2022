

import Foundation

protocol WindSpeedPresenterProtocol {
    func viewDidLoad()
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
    
    func viewDidLoad() {
        let image = interactor.getImageCurrentWindSpeed()
        view?.showWindSpeed(image: image)
        
    }
}
