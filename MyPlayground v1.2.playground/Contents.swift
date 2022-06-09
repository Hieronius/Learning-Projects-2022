
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



class HRManager {
    
    var arrayOfCandidates = [Developer]()
    
    var totalScoreOfWorkInterview = 0
    
    
    
    func scoreOfCandidat(candidate: Developer) {
        for library in candidate.knownLibraries {
            if [library] == ["UIKIt"] {
                print("This person know \(library).It's fine candidat")
                self.totalScoreOfWorkInterview += 1
                break
            } else {
                print("Not good, he don't know UIKit")
            }
        }
        
        if candidate.programmingLanguage == "Swift" {
                print("This person know Swift. Plus to his score")
                self.totalScoreOfWorkInterview += 1
            } else {
                print("Not so good, he don't know Swift")
            }
        
        
        for pattern in candidate.knownPatterns {
            if [pattern] == ["Singleton"] || [pattern] == ["Fabric"] {
                print("This person know \(pattern). Plus one to his scores")
                self.totalScoreOfWorkInterview += 1
            } else {
                print("He don't know patterns")
            }
        }
        
        if candidate.knowEnglish {
            print("this guy know english. It's great")
            self.totalScoreOfWorkInterview += 1
        } else {
            print("This guy doesn't know english. It's sad")
        }
        
        if candidate.hasPortfolio {
            print("This guy done job well. He is a good man")
            self.totalScoreOfWorkInterview += 1
        } else {
            print("This guy doesn't have any projects")
        }
        
        if self.totalScoreOfWorkInterview > 3 {
            print("We will glad to work with you mr. candidate)")
        } else {
            print("Sorry bro but plz prepare a little bit better and come again")
        }
    }
}
    


var myHRManager = HRManager()

var David = Developer(programmingLanguage: "Java", knownLibraries: ["JavaCaffe"], knownPatterns: ["Data Source"], knowEnglish: false, hasPortfolio: false)
myHRManager.scoreOfCandidat(candidate: David)
myHRManager.scoreOfCandidat(candidate: Maxim)
