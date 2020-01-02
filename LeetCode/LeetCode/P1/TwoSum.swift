//
//  TwoSum.swift
//  LeetCode
//
//  Created by guoqingping on 2019/12/29.
//  Copyright © 2019 guoqingping. All rights reserved.
//

import Cocoa

class TwoSum: NSObject {
    
    
    override init() {
        super.init()
        print(twoSum([2,7,11,15], 9))
    }
    
    /**
     给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。

     你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。

     示例:

     给定 nums = [2, 7, 11, 15], target = 9

     因为 nums[0] + nums[1] = 2 + 7 = 9
     所以返回 [0, 1]

     
    思路：使用一个dic, 当遍历一个元素时num，尝试去找匹配数 target - num。如果找到，返回；找不到，将 num作为key，将index作为value,存入dic。遍历完找不到，返回[]
     
     */
    func twoSum(_ nums:[Int], _ target: Int) -> [Int] {
        
        var dic = [Int:Int]()
        for (i,value) in nums.enumerated() {
            let targetNum = target - value
            let j = dic[targetNum]
            if (j != nil) {
                return [j!,i]
            }else{
                dic[value] = i
            }
        }
        
        return [];
    }

}
