import Foundation
import UIKit


func grow(_ arr: [Int]) -> Int {
    return arr.reduce(1,*)
}

grow([1,2,3,4,5])

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



