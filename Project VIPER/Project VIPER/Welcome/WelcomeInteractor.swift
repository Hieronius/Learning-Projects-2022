// Brain of our app.

import Foundation

protocol WelcomeInteractorProtocol: AnyObject {
    func loadDate()
    func loadWeather()
    func loadWindSpeed()
    func loadPressure()
    var temperature: Int { get }
    var wind: Int { get }
    var pressure: Int { get }
}

class WelcomeInteractor: WelcomeInteractorProtocol {
    weak var presenter: WelcomePresenterProtocol?
    let dateService = DateService()
    let weatherService = WeatherService()
    let windSpeedService = WindSpeedService()
    let pressureService = PressureService()
    
    var temperature: Int = 0
    var wind: Int = 0
    var pressure: Int = 0
    
    func loadDate() {
        dateService.getDate { [weak self] date in
            self?.presenter?.didLoad(date: date.description)
        }
    }
    
    func loadWeather() {
        weatherService.getWeather { [weak self] weather in
            self?.presenter?.didLoad(weather: weather)
            self?.temperature = weather
        }
    }
    
    func loadWindSpeed() {
        windSpeedService.getWindSpeed { [weak self] wind in
            print("breakPoint4")
            self?.presenter?.didLoad(wind: wind)
            self?.wind = wind
    }
  }
    
    func loadPressure() {
        pressureService.getPressure { [weak self] pressure in
            self?.presenter?.didLoad(pressure: pressure)
            self?.pressure = pressure
        }
  }
    
}
