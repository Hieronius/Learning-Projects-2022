import Foundation
import UIKit


func warnTheSheep(_ queue: [String]) -> String {
    if queue.last == "wolf" {
        return "Pls go away and stop eating my sheep"
    }
    let wolfPosition = queue.firstIndex(of: "wolf")!
    return "yo, sheep number \(queue[wolfPosition+1]) , there is the wolf"
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
