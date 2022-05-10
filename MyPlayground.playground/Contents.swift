

/* protocol AppStoreProtocol {
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
*/

struct App {
    var appName: String
    var appCategory: String
    var feedBack: [String]?
    
}



struct AppStore {
    
    var appMarket = [App]()
    
    var appsFeedback = [String]()
    
    mutating func  addFeedback(app: App, feedback: String) -> [String] {
        print("New feedback for \(app.appName) - \(feedback)")
        appsFeedback.append(feedback)
        return appsFeedback
    }
    
    mutating func save(app: App) -> [App] {
        appMarket.append(app)
        print("App \(app.appName) was saved to the AppMarket")
        return appMarket
    }
    
    func load(app: App) {
        print("App \(app.appName) was loaded")
    }
    
}

var toDoList = App(appName: "ToDoList", appCategory: "Self-Development")
var maps = App(appName: "Apple Maps", appCategory: "Location")
var game = App(appName: "Star Craft", appCategory: "Games", feedBack: ["Game is so cool!"])

var appStore = AppStore()
appStore.save(app: toDoList)
appStore.save(app: maps)
appStore.appMarket
appStore.load(app: toDoList)

appStore.appMarket[]

// May be a good idea to make sabscript for AppStore array so i can take access to specific app and change properties.


