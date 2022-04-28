import UIKit

class Students {
    var arrayOfStudents: [String]
    
    func arrayOfStudentsSort() -> ([String], Int) {
        var counter = 0
        for student in arrayOfStudents {
            counter += 1
            if counter >= 30 {
                print("There is no more space for new students")
            } else {
                print("Welcome to our class, summoner!")
            }
        }
        return (arrayOfStudents.sorted {$0 < $1}, counter)
    }
    
    init(arrayOfStudents: [String]) {
        self.arrayOfStudents = arrayOfStudents
    }
}

var classOfStudents = Students(arrayOfStudents: ["Darvin", "Jalla", "Kenzo", "Marla", "Antonidas"])
classOfStudents.arrayOfStudentsSort()
