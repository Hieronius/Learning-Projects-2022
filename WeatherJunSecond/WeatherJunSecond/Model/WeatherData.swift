

import Foundation

struct WeatherData: Decodable {
    
    let info: Info
    let fact: Fact
    let forecasts: [Forecast]
    
}

struct Info: Decodable {
    
    let url: String
    
}

struct Fact: Decodable {
    
    let temp: Int
    let icon: String
    let condition: String
    let windSpeed: Int
    let pressureMm: Int
    
}

struct Forecast: Decodable {
    
    let parts: Parts
    
}

struct Parts: Decodable {
    
    let day: Day
    
}

struct Day: Decodable {
    
    let tempMin: Int?
    let tempMax: Int?
    
}
