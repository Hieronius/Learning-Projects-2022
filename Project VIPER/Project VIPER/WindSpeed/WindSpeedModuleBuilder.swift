

import Foundation
import UIKit

class WindSpeedModuleBuilder {
    static func build(wind: Int) -> WindSpeedViewController {
        let interactor = WindSpeedInteractor(wind: wind)
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
