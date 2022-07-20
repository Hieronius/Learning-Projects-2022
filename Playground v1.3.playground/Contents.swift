import Foundation
import UIKit

func digitize(_ num:Int) -> [Int] {
    let string = String(num)
    return string.compactMap { $0.wholeNumberValue }.reversed()
}

digitize(1231414)


