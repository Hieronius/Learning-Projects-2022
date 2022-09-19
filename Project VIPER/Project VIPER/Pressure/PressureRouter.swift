//
//  PressureRouter.swift
//  Project VIPER
//
//  Created by Арсентий Халимовский on 19.09.2022.
//

import Foundation

protocol PressureRouterProtocol: AnyObject {
    
}

class PressureRouter: PressureRouterProtocol {
    weak var presenter: PressurePresenterProtocol?
}
