import Foundation
import UIKit

var a = 2
Double(a).squareRoot()

func squareOrSquareRoot(_ input: [Int]) -> [Int] {
    var arrayOfnumbers = [Int]()
    for number in input {
        if number == Int(Double(number).squareRoot()) * Int(Double(number).squareRoot()){
            arrayOfnumbers.append(Int(Double(number).squareRoot()))
        } else {
            arrayOfnumbers.append(number * number)
        }
    }
    return arrayOfnumbers
}

squareOrSquareRoot([4, 3, 9, 7, 2, 1])



