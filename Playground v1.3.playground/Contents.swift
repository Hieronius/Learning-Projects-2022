import Foundation
import UIKit


func multi_table(_ number: Int) -> String {
    var counter = 2
    var string = "1 * \(number) = \(number * 1)"
    
    for _ in 2...10 {
        string += "\n\(counter) * \(number) = \(number * counter)"
        counter += 1
    }
    print(string)
    return string
}

multi_table(5)

// almost done but seems like result with \n is wrong. Something simple.
