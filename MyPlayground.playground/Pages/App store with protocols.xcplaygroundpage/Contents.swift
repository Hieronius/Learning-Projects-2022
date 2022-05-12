//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)


/*
 extension AppProtocol {
    func printFeedBack() {
        print("\(appName)")
    }
}
myToDoList.printFeedBack()
*/

protocol AppStoreProtocol {
    
    var appStorage: [String]? { get set }
    
    func save()
        
    func load()
        
    func delete()
    
    func leftFeedback()
    
    func leftScore()
    
}

struct AppStore : AppStoreProtocol {
    
    var appStorage: [String]?
    
    mutating func save(app: String?) -> [String]? {
        appStorage!.append(app!)
        return appStorage
    }
    
    func load(app: String?) {
        print("\(app) was loaded")
    }
    
    mutating func delete(app: String?) -> [String]? {
        var appIndex = -1
        for appName in appStorage! {
            appIndex += 1
            if appName == app! {
                break
            }
        }
        appStorage?.remove(at: appIndex)
        return appStorage
    }
    
    func leftFeedback(app: String?) {
        <#code#>
    }
}

var toDoListApp = "To-Do list"
var appleMapsApp = "Apple maps"
var counterStrikeApp = "Counter Strike"
var plannerApp = "Planer"


