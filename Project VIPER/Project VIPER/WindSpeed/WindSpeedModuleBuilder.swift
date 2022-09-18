

import Foundation
import UIKit

class WindSpeedModuleBuilder {
    static func build(windSpeed: Int) -> WindSpeedViewController {
        let interactor = WindSpeedInteractor(windSpeed: windSpeed)
        let router = WindSpeedRouter()
        let presenter = WindSpeedPresenter(interactor: interactor, router: router)
        let storyboard = UIStoryboard(name: "WindSpeed", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "WindSpeed") as! WindSpeedViewController
        viewController.presenter = presenter
        presenter.view = viewController
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
        
        
    }
}
