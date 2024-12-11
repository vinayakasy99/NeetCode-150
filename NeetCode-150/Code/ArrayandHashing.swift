//
//  ArrayandHashing.swift
//  NeetCode-150
//
//  Created by Vinayaka S Yattinahalli on 03/12/24.
//

import UIKit

class ArrayandHashing: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nums = [1,2,3,4]
        let result = productExceptSelf(nums)
        print(result)
    }
    
    // Time: O(N) , Space: O(N)
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var dict = [Int:Int]()
        for num in nums {
            if dict[num] != nil {
                return true
            } else {
                dict[num] = 1
            }
        }
        return false
    }
    
    // Time: O(N) , Space: O(N)
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var dict1 = [Character: Int]()
        var dict2 = [Character: Int]()
        if s.count != t.count {
            return false
        }
        for char in s {
            dict1[char, default: 0] += 1
        }
        for char in t {
            dict2[char, default: 0] += 1
        }
        return dict1 == dict2
    }
    
    // Time: O(N) , Space: O(N)
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var targetHashMap = [Int: Int]()
        for (index,num) in nums.enumerated() {
            let diff = target - num
            
            if let complementIndex = targetHashMap[diff] {
                return [complementIndex, index]
            }
            targetHashMap[num] =  index
            
        }
        return []
    }
    
    // Time: O(N*M) || O(N*M)
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict = [[Int]: [String]]()
        for str in strs {
            var counts = Array(repeating: 0, count: 26)
            for char in str {
                let index = Int(char.asciiValue! - 97)
                counts[index] += 1
            }
            dict[counts, default: []].append(str)
        }
        return Array(dict.values)
        
        
    }
    
    // Time: O(n⋅logn) || O(N)
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dict = [Int:Int]()
        for num in nums{
            dict[num, default:0] += 1
        }
        let sortedDict =  dict.sorted {$0.value > $1.value}
        var result = [Int]()
        for i in 0..<k {
            result.append(sortedDict[i].key)
        }
        return result
    }
    
    // Time: O(N) || O(N)
    func encode(_ strs: [String]) -> String {
        var result = ""
        for str in strs {
            result += str + "😀"
        }
        return result
    }
    
    func decode(_ s: String) -> [String] {
        var words = ""
        var resArray = [String]()
        for i in s {
            if i == "😀" {
                resArray.append(words)
                words = ""
            } else {
                words.append(i)
            }
        }
        return resArray
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(n)
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var prefix = Array(repeating: 1, count: nums.count)
        var suffix = Array(repeating: 1, count: nums.count)
        var result = Array(repeating: 0, count: nums.count)
        
        for i in 1 ..< nums.count {
            prefix[i] = prefix[i - 1] * nums[i - 1]
        }
        
        for i in (0 ..< nums.count - 1).reversed() {
            suffix[i] = suffix[i + 1] * nums[i + 1]
        }
        
        for i in 0 ..< result.count {
            result[i] = prefix[i] * suffix[i]
        }
        
        return result
    }

    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rows = Array(repeating: Set<Character>(), count: 9)
        var cols = Array(repeating: Set<Character>(), count: 9)
        var squares = Array(repeating: Set<Character>(), count: 9)
        
        for r in 0..<9 {
            for c in 0..<9 {
                let value = board[r][c]
                if value == "." { continue }
                
                let squareIndex = (r / 3) * 3 + (c / 3)
                
                if rows[r].contains(value) || cols[c].contains(value) || squares[squareIndex].contains(value) {
                    return false
                }
                
                rows[r].insert(value)
                cols[c].insert(value)
                squares[squareIndex].insert(value)
            }
        }
        
        return true
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(n)
    func longestConsecutive(_ nums: [Int]) -> Int {
           var numSet = Set(nums)
           var longest = 0
           for num in nums {
            if !numSet.contains(num - 1){
                var length = 0
                while numSet.contains(num + length) {
                    length += 1
                }
                longest = max(length, longest)
            }
           }
           return longest
        }

}
