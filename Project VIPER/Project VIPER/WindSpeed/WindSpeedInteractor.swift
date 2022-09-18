

import Foundation
import UIKit

protocol WindSpeedInteractorProtocol {
    func getImageCurrentWindSpeed() -> UIImage?
}
class WindSpeedInteractor {
    weak var presenter: WindSpeedPresenterProtocol?
    
    var windSpeed: Int
    
    init(windSpeed: Int) {
        self.windSpeed = windSpeed
    }
}

extension WindSpeedInteractor: WindSpeedInteractorProtocol {
    func getImageCurrentWindSpeed() -> UIImage? {
        if windSpeed >= 0, windSpeed <= 10 {
            return UIImage(systemName: "wind")
        } else {
            return UIImage(systemName: "wind.circle")
        }
    }
}


