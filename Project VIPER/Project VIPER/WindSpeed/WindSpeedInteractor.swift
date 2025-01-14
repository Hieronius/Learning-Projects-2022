

import Foundation
import UIKit

protocol WindSpeedInteractorProtocol: AnyObject {
    func getImageCurrentWindSpeed() -> UIImage?
}

class WindSpeedInteractor: WindSpeedInteractorProtocol {
    weak var presenter: WindSpeedPresenterProtocol?
    
    var wind: Int
    
    init(wind: Int) {
        self.wind = wind
    }
    
    func getImageCurrentWindSpeed() -> UIImage? {
        if wind > 0 {
            print("breakpoint2")
            return UIImage(systemName: "wind")
            
        } else {
            print("breakpoint3")
            return UIImage(systemName: "wind.circle")
            
        }
    }
}


    



