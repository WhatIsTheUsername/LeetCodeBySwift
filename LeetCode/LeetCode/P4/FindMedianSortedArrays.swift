//
//  FindMedianSortedArrays.swift
//  LeetCode
//
//  Created by guoqingping on 2020/1/2.
//  Copyright © 2020 guoqingping. All rights reserved.
//

import Cocoa


//寻找2个有序数组中位数
class FindMedianSortedArrays: NSObject {
    
    override init() {
        super.init()
        
        print(findMedianSortedArrays([1,2], [3,4]))
    }
    
    
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        
        let n = nums1.count
        let m = nums2.count
        let left:Int = (n+m+1)/2
        let right:Int = (n+m+2)/2
        
        //基数和偶数合并，如果是奇数，会求2次相同的k
        return Double(( getKth(nums1, 0, n-1, nums2, 0, m-1, left)  +  getKth(nums1, 0, n-1, nums2, 0, m-1, right) )) * 0.5
    }
    
    
    //2个有序数组求第k小
    private func getKth(_ num1:[Int],_ start1:Int, _ end1:Int, _ num2:[Int], _ start2:Int, _ end2:Int, _ k:Int) ->Int{
    
        let len1 = end1 - start1 + 1
        let len2 = end2 - start2 + 1
        
        //让len1的长度小于len2，这样就能保证如果数组为空，一定是len1
        if len1 > len2 {
            return getKth(num2, start2, end2, num1, start1, end1, k)
        }
        if len1 == 0 {
            return num2[start2 + k - 1]
        }
        
        if k == 1 {
            return min(num1[start1], num2[start2])
        }
        
        let i = start1 + min(len1, k/2) - 1
        let j = start2 + min(len2, k/2) - 1
        
        if num1[i] > num2[j] {
            return getKth(num1, start1, end1, num2, j+1, end2, k - (j - start2 + 1))
        }else{
            return getKth(num1, i+1, end1, num2, start2, end2, k - (i - start1 + 1))
        }
    }
    
}
