//
//  PressureInteractor.swift
//  Project VIPER
//
//  Created by Арсентий Халимовский on 19.09.2022.
//

import Foundation

protocol PressureInteractorProtocol: AnyObject {
    
}

class PressureInteractor: PressureInteractorProtocol {
    weak var presenter: PressurePresenterProtocol?
    var pressure: Int
    
    init(pressure: Int) {
        self.pressure = pressure
    }
}
