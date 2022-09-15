// Brain of our app.

import Foundation

protocol WelcomeInteractorProtocol: AnyObject {
    
}

class WelcomeInteractor: WelcomeInteractorProtocol {
    weak var presenter: WelcomePresenterProtocol
}
