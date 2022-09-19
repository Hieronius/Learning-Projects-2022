//
//  PressurePresenter.swift
//  Project VIPER
//
//  Created by Арсентий Халимовский on 19.09.2022.
//

import Foundation

protocol PressurePresenterProtocol: AnyObject {
    
}

class PressurePresenter: PressurePresenterProtocol {
    weak var view: PressureViewControllerProtocol?
    var interactor: PressureInteractorProtocol
    var router: PressureRouterProtocol
    
    init(interactor: PressureInteractorProtocol, router: PressureRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}
