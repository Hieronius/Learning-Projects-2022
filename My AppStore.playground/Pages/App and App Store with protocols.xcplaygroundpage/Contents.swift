
import Foundation

var greeting = "Hello, playground"

protocol AppProtocol {
    
    var appName: String { get set }
    var appCategory: String { get set }
    
    var feedback: [String]? { get set }
    var scores: [Int]? { get set }
}

struct App: AppProtocol {
    
    var appName: String
    var appCategory: String
    
    var feedback: [String]?
    var scores: [Int]?
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



struct AppStore: AppStoreProtocol {
    
   var appStorage: [AppProtocol]?
    
    mutating func save(app: AppProtocol) -> [AppProtocol]? {
        if (appStorage?.append(app)) == nil { // this is kind of if else that really work
            appStorage = [app]
        }
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
    
    mutating func addFeedback(app: AppProtocol, appFeedback: String) -> [AppProtocol]? {
        
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
        
        
        mutating func addScore(app: AppProtocol, score: Int) -> [AppProtocol]? { // let's change it like func addFeedback
            
            
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

myAppStore.save(app: myTodoList)

myAppStore.save(app: myMaps)
myAppStore.save(app: snakeGame)
myAppStore.save(app: myPlanner)
myAppStore.save(app: messager)
myAppStore.save(app: instaGigaGram)

myAppStore.load(app: myMaps)

myAppStore.delete(app: myPlanner)
myAppStore.delete(app: messager)


myAppStore.addFeedback(app: myTodoList, appFeedback: "It's great") // it's works because feedback array not emprty
myAppStore.addFeedback(app: myPlanner, appFeedback: "Best app i even seen") // it's won't work because feedback array is empty
myAppStore.appStorage
myTodoList.feedback


myAppStore.addScore(app: myTodoList, score: 5)
myAppStore.appStorage
myTodoList.scores

myAppStore[myTodoList]
myAppStore.appSelector(app: myTodoList)



// Let's make a subscript for appStorage to get access (may be as function "Load")
var array = ["alla", "boy"]
array.firstIndex(of: "alla")


var objects = [myTodoList, myMaps, myPlanner]

//func appIndicator(app: AppProtocol) -> AppProtocol {
//
//    var counter = -1
//    for App in objects {
//        counter += 1
//        if App.appName == app.appName {
//            break
//        }
//    }
//    return objects[counter]
//} // it's a correct way to make func "load" as subscript

//subscript(app: AppProtocol) -> AppProtocol {
//
//    var counter = -1
//    for App in appStorage! {
//        counter += 1
//        if App.appName == app.appName {
//            break
//        }
//    }
//    print("\(appStorage![counter].appName) was selected")
//    return appStorage![counter]
//} change subscritp to the func and it's done

//var appPosition = appIndicator(app: myTodoList)
// ok, that's will return a fresh app without changes. Let's study and read about subscripts tomorrow.

