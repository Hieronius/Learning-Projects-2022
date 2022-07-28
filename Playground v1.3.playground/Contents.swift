import Foundation
import UIKit


func findDifference(_ a: [Int], _ b: [Int]) -> Int {
    
    if a.reduce(1, *) > b.reduce(1, *) {
        return a.reduce(1, *) - b.reduce(1, *)
    } else {
        return b.reduce(1, *) - a.reduce(1, *)
    }
    
    
}

findDifference([1,4,4], [3,2,5])
findDifference([9,7,2], [5,2,2])


// return Int(exactly: UInt(a.reduce(1, *)) - UInt(b.reduce(1, *)))!
