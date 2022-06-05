
// 13. Methods

class Developer {
    var programmingLanguage: String
    var knownLibraries: [String]
    var knownPatterns: [String]
    var knownEnglish: Bool
    var hasPortfolio: Bool
    
    init(programmingLanguage: String, knownLibraries: [String], knownPatterns: [String], knownEnglish: Bool, hasPortfolio: Bool) {
        self.programmingLanguage = programmingLanguage
        self.knownLibraries = knownLibraries
        self.knownPatterns = knownPatterns
        self.knownEnglish = knownEnglish
        self.hasPortfolio = hasPortfolio
    }
}
