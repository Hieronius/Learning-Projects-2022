//
//  ImageViewerInteractor.swift
//  Super easy dev
//
//  Created by Арсентий Халимовский on 15.09.2022
//

import UIKit

protocol ImageViewerInteractorProtocol: AnyObject {
    func getImageCurrentTemperature() -> UIImage?
}

class ImageViewerInteractor: ImageViewerInteractorProtocol {
    weak var presenter: ImageViewerPresenterProtocol?
    let temperature: Int
    
    init(temperature: Int) {
        self.temperature = temperature
    }
    
    func getImageCurrentTemperature() -> UIImage? {
        if temperature < 0 {
            return UIImage(systemName: "showflake")
        } else if temperature >= 0, temperature < 10 {
            return UIImage(systemName: "cloud.fill")
        } else {
            return UIImage(systemName: "sun.min.fill")
        }
    }
}
