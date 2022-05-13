
import Foundation

var greeting = "Hello, playground"

protocol AppProtocol {
    
    var appName: String { get set }
    var appCategory: String { get set }
    
    var feedback: [String]? { get set }
    var scores: [Int]? { get set }
}




protocol AppStoreProtocol {
    
    var appStorage: [AppProtocol]? { get set }
    
    func save(app: AppProtocol) -> [AppProtocol]?
    
    func load(app: AppProtocol)
    
    func delete()
    
    func addFeedback()
    
    func addScore()
}

struct AppStore: AppStoreProtocol {
    
   var appStorage: [AppProtocol]?
    
    mutating func save(app: AppProtocol) -> [AppProtocol]? {
        appStorage.append(app)
        print("\(app.appName) was uploaded to the AppStore")
        return appStorage
    }
    
    func load(app: AppProtocol) {
        print("\(app.appName) was opened")
    }
    
    func delete() {
        print("Hello")
    }
    
    func addFeedback() {
        print("Yo")
    }
    
    func addScore() {
        print("Yay")
    }
}

// May be i should make struct App and just use App like type in appStorage
