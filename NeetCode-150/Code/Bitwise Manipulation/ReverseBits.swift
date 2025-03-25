//
//  ReverseBits.swift
//  NeetCode-150
//
//  Created by Vinayaka S Yattinahalli on 25/03/25.
//
class ReverseBits {
    func reverseBits(_ n: Int) -> Int {
        var res = 0
        var num = n
        for i in 0..<32 {
            let bit = (num >> i) & 1
            res |= (bit << (31 - i))
        }
        return res
    }
}
