// Build our modules
// Can be also named as Configurator or Assembly (Rambler)



import UIKit

class WelcomeModuleBuilder {
    static func build() -> ViewController {
        let interactor = WelcomeInteractor()
        let router = WelcomeRouter()
        let presenter = WelcomePresenter(interactor: interactor, router: router)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "Main") as! ViewController
        viewController.presenter = presenter
        presenter.view = viewController
        interactor.presenter = presenter
        router.presenter = presenter
        return viewController
    }
}
