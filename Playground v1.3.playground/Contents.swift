import Foundation
import UIKit

var a = 2
Double(a).squareRoot()

func squareOrSquareRoot(_ input: [Int]) -> [Int] {
    var arrayOfnumbers = [Int]()
    for number in input {
        if (Double(number).squareRoot())  == 0 {
            arrayOfnumbers.append(Int(Double(number).squareRoot()))
        } else {
            arrayOfnumbers.append(number * number)
        }
    }
    return arrayOfnumbers
}

squareOrSquareRoot([4, 3, 9, 7, 2, 1])

let teacher: String? = nil
var result = teacher ?? "0"
if let unknownTeacher = teacher {
    print("\(unknownTeacher)")
} else {
    print("I don't know")
}
