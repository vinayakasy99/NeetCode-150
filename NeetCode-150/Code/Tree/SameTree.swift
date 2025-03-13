//
//  SameTree.swift
//  NeetCode-150
//
//  Created by Vinayaka S Yattinahalli on 13/03/25.
//
import UIKit

//https://leetcode.com/problems/same-tree/
//https://neetcode.io/problems/same-binary-tree

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class SameTree {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }
        if p != nil && q != nil && p!.val == q!.val {
            return isSameTree(p!.left, q!.left) && isSameTree(p!.right, q!.right)
        }
        return false
    }
}
