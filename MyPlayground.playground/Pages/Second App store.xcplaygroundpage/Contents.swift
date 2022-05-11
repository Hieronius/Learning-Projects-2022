//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

protocol AppStoreProtocol {
    var nameOfTheApp: String { get set }
    var appCategory: String { get set }
    
    var arrayOfApps: [AppStoreProtocol]? { get set }
    
    func saveApp(app: AppStoreProtocol) -> [AppStoreProtocol]?
    func loadApp(app: AppStoreProtocol)
    
    
}

class AppStore: AppStoreProtocol {
   
    var nameOfTheApp: String
    var appCategory: String
    
    var arrayOfApps: [AppStoreProtocol]?
    
    func saveApp(app: AppStoreProtocol) -> [AppStoreProtocol]? {
        arrayOfApps?.append(app)
        print("\(app.nameOfTheApp) was saved in AppStore")
        return arrayOfApps
    }
    
    func loadApp(app: AppStoreProtocol) {
        print("\(app) was launched")
    }
    
    init(nameOfTheApp: String, appCategory: String) {
        self.nameOfTheApp = nameOfTheApp
        self.appCategory = appCategory
    }
}

var toDoList = AppStore(nameOfTheApp: "To-Do list", appCategory: "SelfDevelopment")
toDoList.saveApp(app: <#T##AppStoreProtocol#>)

// Almost done with load and save func but it seems like i don't need class "AppStore". May be protocol will be enough

// May be i need empty class AppStore with extension
