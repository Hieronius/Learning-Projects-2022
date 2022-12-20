
import Foundation

// Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
//
// You may assume that each input would have exactly one solution, and you may not use the same element twice.
//
// You can return the answer in any order.

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var total = [Int]()
        for num in nums {
           let result = (num + (nums[nums.firstIndex(of: num) ?? 0 + 1])) % target
            if result == 0 {
                total =  [num, nums[nums.firstIndex(of: num) ?? 0 + 1]]
            } else {
                total = [0]
            }
        }
        
          return total
    }
}

var solution = Solution()
print(solution.twoSum([1,2], 3))
