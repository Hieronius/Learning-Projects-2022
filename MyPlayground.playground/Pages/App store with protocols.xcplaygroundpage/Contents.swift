//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

protocol AppProtocol {
    
    var appName: String { get set }
    var appCategory: [String]? { get set }
    
    var feedBack: [String]? { get set }
    var score: [Int]? { get set }
}

struct App: AppProtocol {
    
    var appName: String
    var appCategory: [String]?
    
    var feedBack: [String]?
    var score: [Int]?
    
}


var myToDoList = App(appName: "ToDo list", appCategory: ["Self-development"], feedBack: ["It's a very nice app", "Very convenient app"], score: [5, 5, 4, 5])
var myMaps = App(appName: "Apple Maps", appCategory: ["Maps"])
myMaps.feedBack = ["Very convenient maps"]

/*
 extension AppProtocol {
    func printFeedBack() {
        print("\(appName)")
    }
}
myToDoList.printFeedBack()
*/

protocol AppStoreProtocol {
    
    var appStorage: [App]? { get set }
    
    func save()
        
    func load()
        
    func delete()
    
    func leftFeedback()
    
    func leftScore()
    
}
