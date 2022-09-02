import Foundation
import UIKit


// quick sort
func quickSort(arr:[Int]) -> [Int] {
    var less = [Int]()
    var equal = [Int]()
    var greater = [Int]()
    
    if arr.count > 1 {
        let pivot = arr[0]
        
        for x in arr {
            if x < pivot {
                less.append(x)
            }
            if x == pivot {
                equal.append(x)
            }
            if x > pivot {
                greater.append(x)
            }
        }
        return (quickSort(arr: less) + equal + quickSort(arr: greater))
    } else {
        return arr
    }
}

let sortedArr = quickSort(arr: [1, 5, 10, 2, 1, 5, 15, 100, 1])

// Counting Sort

func countingSort(list: [Int], maxVal: Int) -> [Int] {
    
    let size = list.count
    let m = maxVal + 1
    var container = [Int](repeating: 0, count: m)
    
    for j in list {
        container[j] += 1
    }
    
    var outer = [Int](repeating: 0, count: size)
    var i = 0
    
    for a in 0..<m {
        for c in 0..<container[a] {
            outer[i] = a
            i += 1
        }
    }
    return outer
}

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




// Cocktail Sort
var arr = [123, 12, 435, 65, 767, 433]
var left: Int = 0
var right: Int = arr.count - 1
var index: Int = 0

func cocktailSort() -> [Int] {
    while left < right {
        for i in left..<right {
            if arr[i] > arr[i+1] {
                arr.swapAt(i, i+1)
                index = i
            }
        }
        
        right = index
        let temp: Int = left + 1
        if temp < right {
            for i in (temp...right).reversed() {
                if arr[i] < arr[i-1] {
                    arr.swapAt(i, i-1)
                    index = i
                }
            }
            left = index
        }
    }
    return arr
}



cocktailSort()





