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
        let str = ["eat","tea","tan","ate","nat","bat"]
        let test = groupAnagrams(str)
        print(test)
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
}
