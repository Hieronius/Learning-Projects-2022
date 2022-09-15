// Build our modules



import UIKit

class WelcomeModuleBuilder {
    static func build() -> ViewController {
        let interactor = WelcomeInteractor()
        let router = WelcomeRouter()
        let presenter = WelcomePresenter(interactor: interactor, router: router)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
    }
}
