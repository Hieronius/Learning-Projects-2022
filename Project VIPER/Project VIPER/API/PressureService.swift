//
//  PressureService.swift
//  Project VIPER
//
//  Created by Арсентий Халимовский on 19.09.2022.
//

import Foundation

class PressureService {
    func getPressure(completion: @escaping (Int) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
        let pressure = Int.random(in: 100...1000)
        completion(pressure)
    }
  }
}
