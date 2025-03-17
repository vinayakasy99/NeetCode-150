//
//  Untitled.swift
//  NeetCode-150
//
//  Created by Vinayaka S Yattinahalli on 17/03/25.
//
//https://neetcode.io/solutions/subtree-of-another-tree
//https://leetcode.com/problems/subtree-of-another-tree

class Solution {
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        guard let subRoot = subRoot else {
            return true
        }
        guard let root = root else {
            return false
        }

        if sameTree(root, subRoot) {
            return true
        }
        return isSubtree(root.left, subRoot) || isSubtree(root.right, subRoot)
    }

    private func sameTree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        if root == nil && subRoot == nil {
            return true
        }
        if let root = root, let subRoot = subRoot, root.val == subRoot.val {
            return sameTree(root.left, subRoot.left) && sameTree(root.right, subRoot.right)
        }
        return false
    }
}
