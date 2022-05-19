
import Foundation


/// Colclusion
///
/// Made a protocol for "app" entity
/// Made a protocol for "appStore" entity
/// Made a class for "app" entity and 5 instances
/// Made a class for "appStore" entity and instance for it
/// After made a couple of apps and i can use save/load/addFeedback/addScore/appSelector/subscript functions
/// Every time when i wll change the app in storage it will affect the app without a storage
/// Like vice versa if we change a property of app in the appStorage that will affect the original app.




var greeting = "Hello, playground"

protocol AppProtocol {
    
    var appName: String { get set }
    var appCategory: String { get set }
    
    var feedback: [String]? { get set }
    var scores: [Int]? { get set }
}

class App: AppProtocol {
    
    var appName: String
    var appCategory: String
    
    var feedback: [String]?
    var scores: [Int]?
    
    init(appName:String, appCategory: String) {
        self.appName = appName
        self.appCategory = appCategory
    }
}




protocol AppStoreProtocol {
    
    var appStorage: [AppProtocol]? { get set }
    
    mutating func save(app: AppProtocol) -> [AppProtocol]?
    
    func load(app: AppProtocol)
    
    mutating func delete(app: AppProtocol) -> [AppProtocol]?
    
    mutating func addFeedback(app: AppProtocol, appFeedback: String) -> [AppProtocol]?
    
    mutating func addScore(app: AppProtocol, score: Int) -> [AppProtocol]?
    
    func appSelector(app: AppProtocol) -> AppProtocol
    
    subscript(app: AppProtocol) -> AppProtocol { get }
}



class AppStore: AppStoreProtocol {
    
   var appStorage: [AppProtocol]?
    
    func save(app: AppProtocol) -> [AppProtocol]? {
        if (appStorage?.append(app)) == nil { // this is kind of if else that really work
            appStorage = [app]
        }
        print("\(app.appName) was uploaded to the AppStore")
        return appStorage
    }
    
    func load(app: AppProtocol) {
        print("\(app.appName) was opened")
    }
    
    func delete(app: AppProtocol) -> [AppProtocol]? {
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
    
    func addFeedback(app: AppProtocol, appFeedback: String) -> [AppProtocol]? {
        
        var counter = -1
        for App in appStorage! {
            counter += 1
            if App.appName == app.appName {
                break
                
                
            }
        }
        if (appStorage?[counter].feedback?.append(appFeedback)) == nil { // this is kind of if else that really work
            appStorage?[counter].feedback = [appFeedback]
        }
        print("Feedback was added to \(app.appName)")
        return appStorage
    }
        
        
        func addScore(app: AppProtocol, score: Int) -> [AppProtocol]? { // let's change it like func addFeedback
            
            
            var counter = -1
            for App in appStorage! {
                counter += 1
                if App.appName == app.appName {
                    break
                }
            }
            
            
            switch score {
            case 1...5:
                if (appStorage?[counter].scores?.append(score)) == nil { // this is kind of if else that really work
                    appStorage?[counter].scores = [score]
                }
                print("Score for \(app.appName) was added")
            default:
            print("Wrong score")
        }
            return appStorage
    
}
    
    func appSelector(app: AppProtocol) -> AppProtocol {
        
        var counter = -1
            for App in appStorage! {
                counter += 1
                if App.appName == app.appName {
                    break
                }
            }
            print("\(appStorage![counter].appName) was selected")
            return appStorage![counter]
    }
    
    subscript(app: AppProtocol) -> AppProtocol {
        
        var counter = -1
            for App in appStorage! {
                counter += 1
                if App.appName == app.appName {
                    break
                }
            }
            print("\(appStorage![counter].appName) was selected")
            return appStorage![counter]
    }
}

var myAppStore = AppStore()

var myTodoList: AppProtocol = App(appName: "ToDo list", appCategory: "Self-development")
var myMaps = App(appName: "Apple maps", appCategory: "Other")
var snakeGame = App(appName: "Snake", appCategory: "Games")
var myPlanner = App(appName: "Planner", appCategory: "Self-development")
var messager = App(appName: "Facelook", appCategory: "Social media")
var instaGigaGram = App(appName: "InstaGigaGram", appCategory: "Social media")


