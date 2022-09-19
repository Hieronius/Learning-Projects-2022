// Gives data for user or accepting data from user

import Foundation

protocol WelcomePresenterProtocol: AnyObject {
    func viewDidLoaded()
    func didTapImageButton()
    func didTapWindSpeedButton()
    func didLoad(date: String?)
    func didLoad(weather: Int?)
    func didLoad(wind: Int?)
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
    
    func didTapImageButton() {
        let temperature = interactor?.temperature
        router?.openImage(for: temperature!)
    }
    
    func didTapWindSpeedButton() {
        let wind = interactor?.wind
        router?.openWindSpeed(for: wind!)
    }
    
    func didLoad(date: String?) {
        view?.showDate(date: date ?? "No date today")
    }
    
    func didLoad(weather: Int?) {
        let temperature = weather?.description ?? "No  temperature"
        view?.showWeather(weather: temperature)
    }
    
    func didLoad(wind: Int?) {
        let wind = wind?.description ?? "No wind speed"
        view?.showWindSpeed(wind: wind)
    }
    
}
