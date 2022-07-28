import Foundation
import UIKit


var a = ""
var b = ""
var c = Int(a) ?? 1
let sum = String((Int(a) ?? 0) + (Int(b) ?? 0))

func sum_str(_ a:String, _ b:String) -> String {
    if a == a && b == b {
        let sum = String((Int(a) ?? 0) + (Int(b) ?? 0))
            return sum
    } else if a == "" || b == "" {
        return "0"
    } else {
      return "0"
    }

}



