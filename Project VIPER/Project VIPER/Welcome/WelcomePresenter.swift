// Gives data for user or accepting data from user

import Foundation

protocol WelcomePresenterProtocol: AnyObject {
    func viewDidLoaded()
    func didLoad(date: String?)
    func didLoad(weather: Int?)
}

class WelcomePresenter {
    weak var view: WelcomeViewProtocol?
    var router: WelcomeRouterProtocol?
    var interactor: WelcomeInteractorProtocol?
    
    init(interactor: WelcomeInteractorProtocol, router: WelcomeRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension WelcomePresenter: WelcomePresenterProtocol {
    func viewDidLoaded() {
        interactor?.loadDate()
        interactor?.loadWeather()
    }
    
    func didLoad(date: String?) {
        view?.showDate(date: date ?? "No date today")
    }
    
    func didLoad(weather: Int?) {
        let temperature = weather?.description ?? "No  temperature"
        view?.showWeather(weather: temperature)
    }
    
}
