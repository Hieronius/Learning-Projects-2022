import Foundation
import UIKit


var newArr = [1,5,4,2,1]
print(newArr.sorted {$0>$1}.reversed())
func flip(_ direction: String, _ a: [Int]) -> [Int] {
    
    switch direction {
    case "R":
        let b = Array(a.sorted {$0>$1}.reversed())
        return b
    case "L":
      let b = Array(a.sorted {$0<$1}.reversed())
        return b
    default:
        return []
    }
}
flip("R", [1,5,4,2,1])
flip("L", [1,5,4,2,1])

func take(_ arr: [Int], _ n: Int) -> [Int] {
    if arr.isEmpty {
        return []
    } else if n < 1 {
        return []
    } else if arr.count < n {
            return arr
        } else {
            
        return Array(arr[0..<n])
    }
    
}
take([0, 1, 2, 3, 5, 8, 13], 3)

func firstNonConsecutive (_ arr: [Int]) -> Int? {
    var counter = 0
    var newArr = arr
    for number in arr {
        if number != counter + number - 1 {
            newArr.remove(at: newArr[number])
        }
    }
    return nil
}

var arr = [1,2,3,4,6,7,8]
firstNonConsecutive(arr)



