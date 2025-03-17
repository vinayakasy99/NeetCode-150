//
//  BalancedBinaryTree.swift
//  NeetCode-150
//
//  Created by Vinayaka S Yattinahalli on 14/03/25.
//
import UIKit

//https://leetcode.com/problems/balanced-binary-tree/description/
//https://neetcode.io/solutions/balanced-binary-tree

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

class BalancedBinaryTree {
    func isBalanced(_ root: TreeNode?) -> Bool {
        return dfs(root).balanced
    }
    
    private func dfs(_ root: TreeNode?) -> (balanced: Bool, height: Int) {
        guard let root = root else {
            return (true, 0)
        }
        
        let left = dfs(root.left)
        let right = dfs(root.right)
        
        let balanced = left.balanced && right.balanced && abs(left.height - right.height) <= 1
        let height = 1 + max(left.height, right.height)
        
        return (balanced, height)
    }
}
