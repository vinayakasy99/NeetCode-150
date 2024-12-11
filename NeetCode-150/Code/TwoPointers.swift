//
//  TwoPointers.swift
//  NeetCode-150
//
//  Created by Vinayaka S Yattinahalli on 03/12/24.
//

import UIKit

class TwoPointers: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // O(n) || O(1)
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
           var left = 0
           var right = numbers.count - 1

           while left < right {
            if (numbers[left] +  numbers[right]) < target {
                left += 1
            } else if (numbers[left] +  numbers[right]) > target {
                right -= 1
            } else {
                return [left+1, right+1]
            }
           }
           return []
        }
   

}
