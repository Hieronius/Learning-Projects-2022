import CoreGraphics
/// Type property

/* Global variables it's a variables that can be used in enywhere in the code
   Local variables free to use only in inflaence area like func or closure body.
 
   Property of type - it's a special property of class, stuct or enums and can't be blank or without value.
 
   Best idea to incapsulate global variables into the struct and if you need a specific variable just use a dot sintaxis */

struct myGlobalVariables {
    
    static var firstVar = 1
    static var secondVar = 2
    static var thirdVar = 3
}

var myNewArray = [myGlobalVariables.firstVar, myGlobalVariables.secondVar, myGlobalVariables.thirdVar]

var myFirstLocalVar = myGlobalVariables.firstVar

class FirstClass {
    var arraySortedLeft: [Int]
    
    func sorted() -> [Int] {
        return arraySortedLeft.sorted(by: {$0 < $1} )
        
        
}
    init(arraySortedLeft: [Int]) {
        self.arraySortedLeft = arraySortedLeft
    }
    
}

var objectOfFirstClass = FirstClass(arraySortedLeft: myNewArray)

// Let's think about func sorted that want to change my arr variables
print(var secondNewArray = objectOfFirstClass.sorted()



class SecondClass {
    var arraySortedRight: [Int] {
        get {
            return arraySortedRight.sorted(by: {$0 > $1 })
        }
    }
}

var firstClassInstance = FirstClass(arraySortedLeft: myNewArray)
