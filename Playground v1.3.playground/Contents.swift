import Foundation
import UIKit

// bubble sort
func bubbleSort(_ input: [Int]) -> [Int] {
    guard input.count > 1 else {
        return input
    }
    
    var result = input
    let count = result.count
    
    var isSwapped = false
    
    repeat {
    
    isSwapped = false
        
        for index in 1..<count {
            if result[index] < result[index-1] {
                result.swapAt(index-1, index)
                isSwapped = true
            }
        }
    } while isSwapped
    
    return result
}

bubbleSort([1, 5, 10, 2, 1, 5, 15, 100, 1])





var newArr = ["sheep", "sheep", "sheep", "sheep", "sheep", "wolf", "sheep", "sheep"].reversed()
print(newArr)

func warnTheSheep(_ queue: [String]) -> String {
    if queue.last == "wolf" {
        return "Pls go away and stop eating my sheep"
    }
    for animal in queue.reversed()
}

warnTheSheep(["sheep", "sheep", "sheep", "sheep", "sheep", "wolf", "sheep", "sheep"])
warnTheSheep(["sheep", "wolf", "sheep", "sheep", "sheep", "sheep", "sheep"])
warnTheSheep(["sheep", "sheep", "wolf"])









func stringy(_ size: Int) -> String {

    var sum1 = ""
    var sum2 = "1"
    
    if size % 2 == 0 {
        for _ in 1...size/2 {
            sum1 += "10"
        }
        return sum1
        
    } else {
        for _ in 0...size/2 {
            sum2 += "01"
        }
        return sum2
    }
    
}
