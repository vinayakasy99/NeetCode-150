//
//  SingleNumber.swift
//  NeetCode-150
//
//  Created by Vinayaka S Yattinahalli on 18/03/25.
//


class SingleNumber {
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        for num in nums {
            result ^= num  // XOR-ing all numbers
        }
        return result
    }
}
