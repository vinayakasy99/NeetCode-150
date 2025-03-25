//
//  CountingBits.swift
//  NeetCode-150
//
//  Created by Vinayaka S Yattinahalli on 25/03/25.
//

class CountingBits {
    //Time Complexity: O(nlogn) || Space Compelxity: O(n)
     func countBits(_ n: Int) -> [Int] {
         if n == 0 {
             return [0]
         }
         var res = [Int](repeating: 0, count: n+1)
         for i in 1...n {
             var num = i
             var count = 0
             while num > 0 {
                 num = num & (num-1)
                 count += 1
             }
             if count != 0 {
                 res[i] = count
             }
         }
         return res
     }
    // dp o(n)
    func countBits1(_ n: Int) -> [Int] {
        var res = [Int](repeating: 0, count: n+1)
        for i in 1...n {
            res[i] = res[i >> 1] + (i & 1)
        }
        return res
    }
}
