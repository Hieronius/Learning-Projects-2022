import CoreGraphics
/// Type property

/* Global variables it's a variables that can be used in enywhere in the code
   Local variables free to use only in inflaence area like func or closure body.
 
   Property of type - it's a special property of class, stuct or enums and can't be blank or without value.
 
   Best idea to incapsulate global variables into the struct and if you need a specific variable just use a dot sintaxis */

struct MyGlobalVariables {
    
    static var firstVar = 1
    static var secondVar = 2
    static var thirdVar = 3
}

var myStructInstance = MyGlobalVariables()
var myArray = [MyGlobalVariables.firstVar, MyGlobalVariables.secondVar, MyGlobalVariables.thirdVar]


class FirstClass {
    var arraySortedLeft: [Int]
    
    func sortedFromLeftToRight() -> [Int] {
        return arraySortedLeft.sorted(by: {$0 > $1} )
        
        
}
    init(arraySortedLeft: [Int]) {
        self.arraySortedLeft = arraySortedLeft
    }
    
}

var fromFirstClass = FirstClass(arraySortedLeft: myArray)
fromFirstClass.sortedFromLeftToRight()
print(fromFirstClass.arraySortedLeft)


class SecondClass {
    var arraySortedRight: [Int]
    
    func sortedFromRightToLeft() -> [Int] {
        
        return arraySortedRight.sorted(by: {$0 > $1 })
    }
    
    init(arraySortedRight: [Int]) {
        self.arraySortedRight = arraySortedRight
    }
}

var fromSecondClass = SecondClass(arraySortedRight: myArray)
print(fromSecondClass.sortedFromRightToLeft())
