import Foundation
import UIKit


var array = [12,32,43]
array.map {$0*$1*$2}


func accum(_ s: String) -> String {
    var totalString = ""
    var counter = 1
for letter in s {
  totalString += String(letter) + "-"
}
    return String(totalString.dropLast())
}

accum("abcd")







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
