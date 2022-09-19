// Gives data for user or accepting data from user

import Foundation

protocol WelcomePresenterProtocol: AnyObject {
    func viewDidLoaded()
    func didTapImageButton()
    func didTapWindSpeedButton()
    func didLoad(date: String?)
    func didLoad(weather: Int?)
    func didLoad(wind: Int?)
    func didLoad(pressure: Int?)
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
        interactor?.loadWindSpeed()
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
        print("Date breakpoint2")
    }
    
    func didLoad(weather: Int?) {
        let temperature = weather?.description ?? "No  temperature"
        view?.showWeather(weather: temperature)
        print("Weather breakpoint2")
    }
    
    func didLoad(wind: Int?) {
        let wind = wind?.description ?? "No wind speed"
        view?.showWindSpeed(wind: wind)
        print("Wind breakpoint 5")
    }
    
    func didLoad(pressure: Int?) {
        let pressure = pressure?.description ?? "No pressure"
        view?.showPressure(pressure: pressure)
    }
    
}
