
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
    
    mutating func save(app: AppProtocol) -> [AppProtocol]?
    
    func load(app: AppProtocol)
    
    mutating func delete(app: AppProtocol) -> [AppProtocol]?
    
    mutating func addFeedback(app: inout AppProtocol, feedback: String) -> AppProtocol
    
    mutating func addScore(app: inout AppProtocol, score: Int) -> AppProtocol
}



struct AppStore: AppStoreProtocol {
    
   var appStorage: [AppProtocol]?
    
    mutating func save(app: AppProtocol) -> [AppProtocol]? {
        appStorage?.append(app)
        print("\(app.appName) was uploaded to the AppStore")
        return appStorage
    }
    
    func load(app: AppProtocol) {
        print("\(app.appName) was opened")
    }
    
    mutating func delete(app: AppProtocol) -> [AppProtocol]? {
        var counter = -1
        for App in appStorage! {
            counter += 1
            if App.appName == app.appName {
                break
            }
        }
        appStorage?.remove(at: counter)
        print("App was deleted")
        return appStorage
    }
    
    mutating func addFeedback(app: inout AppProtocol, feedback: String) -> AppProtocol {
        app.feedback?.append(feedback)
        print("feedback for \(app.appName) was added")
        return app
    }
    
    func addScore(app: inout AppProtocol, score: Int) -> AppProtocol {
        switch score {
        case 1...5:
            app.scores?.append(score)
            print("Score for \(app.appName) was added")
        default:
        print("Wrong score")
    }
    return app
}
    
}
// May be i should make struct App and just use App like type in appStorage
