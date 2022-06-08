
// 13. Methods

class Developer {
    var programmingLanguage: String
    var knownLibraries: [String]
    var knownPatterns: [String]
    var knowEnglish: Bool
    var hasPortfolio: Bool
    
    
    func printAllProperties() {
        print("Programming language is \(self.programmingLanguage)")
        print("Known libraries is \(self.knownLibraries)")
        print("Knows patterns is \(self.knownPatterns)")
        print("Person know the english is \(self.knowEnglish)")
        print("Person has a portfolio is \(self.hasPortfolio)")
    }
    
    init(programmingLanguage: String, knownLibraries: [String], knownPatterns: [String], knowEnglish: Bool, hasPortfolio: Bool) {
        self.programmingLanguage = programmingLanguage
        self.knownLibraries = knownLibraries
        self.knownPatterns = knownPatterns
        self.knowEnglish = knowEnglish
        self.hasPortfolio = hasPortfolio
    }
}

var Maxim = Developer(programmingLanguage: "Swift", knownLibraries: ["UIKIt", "SwiftUI"], knownPatterns: ["Singleton", "Fabric"], knowEnglish: true, hasPortfolio: true)

Maxim.printAllProperties()
