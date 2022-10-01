//
//  PressureModuleBuilder.swift
//  Project VIPER
//
//  Created by Арсентий Халимовский on 19.09.2022.
//

import Foundation

class PressureModuleBuilder {
    static func build(pressure: pressure) -> PressureViewController {
        let interactor = PressureInteractor()
        
        
        let router = PressureRouter()
        
        
        let presenter = PressurePresenter(interactor: interactor, router: router)
        
        
        
        let storyboard =
        
        
        let viewController = 
    }
}
