// Brain of our app.

import Foundation

protocol WelcomeInteractorProtocol: AnyObject {
    func loadDate()
    func loadWeather()
    func loadWindSpeed()
    var temperature: Int { get }
    var windSpeed: Int { get }
}

class WelcomeInteractor: WelcomeInteractorProtocol {
    weak var presenter: WelcomePresenterProtocol?
    let dateService = DateService()
    let weatherService = WeatherService()
    let windSpeedService = WindSpeedService()
    
    var temperature: Int = 0
    var windSpeed: Int = 0
    
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
        windSpeedService.getWindSpeed { [weak self] windSpeed in
            self?.presenter?.didLoad(windSpeed:windSpeed)
            self?.windSpeed = windSpeed
    }
  }
}
