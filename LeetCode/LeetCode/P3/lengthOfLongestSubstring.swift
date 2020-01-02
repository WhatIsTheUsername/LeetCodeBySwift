//
//  lengthOfLongestSubstring.swift
//  LeetCode
//
//  Created by guoqingping on 2019/12/31.
//  Copyright © 2019 guoqingping. All rights reserved.
//

import Cocoa

class lengthOfLongestSubstring: NSObject {
    
    
    /**
     
     给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。

     示例 1:

     输入: "abcabcbb"
     输出: 3
     解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
     示例 2:

     输入: "bbbbb"
     输出: 1
     解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
     示例 3:

     输入: "pwwkew"
     输出: 3
     解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
          请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。

     
     
     思路:  利用滑窗来获取最长子串，滑窗内的字符都不相同。
        1、初始化一个字典dic,保存元素和最后出现的index。初始化一个begin,标识滑窗最左边的index。初始化一个max,标识滑窗最大值
    2、当遍历一个元素时，如果dic存在相同元素，就更新出现的index,begin往右移。如果不存在，直接加入。使用当前遍历的index - begin，即可得到滑窗大小，与max比较取最大值
          
     */
    
    
    override init() {
        super.init()
        
        print(lengthOfLongestSubstring("abba"))
    }
    
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        
        var dic:[Character:Int] = [Character:Int]()
        var begin = 0
        var maxLength = 0
        
        for (index,char) in s.enumerated() {
            if dic.keys.contains(char) {
                //重复元素需在当前窗口中查找
                if (dic[char]! + 1) > begin {
                    begin = dic[char]! + 1
                }
                dic.updateValue(index, forKey: char)
            }else{
                dic[char] = index
            }
            maxLength = max(maxLength, index-begin+1)
        }
        
        return maxLength
    }
}
