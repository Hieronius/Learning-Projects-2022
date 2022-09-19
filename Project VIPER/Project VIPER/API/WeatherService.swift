//
//  WeatherService.swift
//  Project VIPER
//
//  Created by Арсентий Халимовский on 15.09.2022.
//

import Foundation

class WeatherService {
    func getWeather(completion: @escaping (Int) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let temperature = Int.random(in: -30...30)
            completion(temperature)
            
        }
    }
}
