import UIKit

func stringy(_ size: Int) -> String {

  var result = ""
  for number in 1...size {
    if number % 2 == 0 {
      result += "0"
    } else {
      result += "1"
    }
    
  }
  return result
  }


