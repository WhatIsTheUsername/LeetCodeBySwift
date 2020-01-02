//
//  AddTwoNumber.swift
//  LeetCode
//
//  Created by guoqingping on 2019/12/29.
//  Copyright © 2019 guoqingping. All rights reserved.
//

import Cocoa

/**
 
 给出两个 非空的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。

 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。

 示例：

 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/add-two-numbers
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 思路：1、初始化进位标识flag = 0。取2个链表节点p、q,  q+p+0 的值，如果大于10，flag =1；不大于10，flag=0 1,取余作为新链表头;如果值不大于0，值直接作为新链表头，flag=0。p、q取下一位，依次往后。
 
 2、如果有一条链表提前遍历完，则使用0替代
 
 
 
 */

class ListNode {
    var val : Int
    var next : ListNode?
    init(_ val : Int) {
        self.val = val
        self.next = nil
    }
}

class AddTwoNumber: NSObject {

    
    override init() {
        super.init()
        
        let L1 = createList([2,4,3])
        let L2 = createList([5,6,4])
        
        print(addTwoNumbers(L1, L2))
    }
    
    
    func createList(_ arr : [Int]) -> ListNode {
        var head:ListNode?
        var temp:ListNode?
        
        for item in arr {
            let newNode = ListNode(item)
            if head == nil {
                head = newNode
                temp = head
            }else{
                temp?.next = newNode
                temp = newNode
            }
        }
        
        return head!
    }
    
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode?{
        
        var p:ListNode? = l1
        var q:ListNode? = l2
        var node:ListNode = ListNode(0)
        let head = node
        var flag = 0
        
        while (p?.val != nil || q?.val != nil || flag == 1) {
            
            let val1:Int = p?.val ?? 0
            let val2:Int = q?.val ?? 0
            var val:Int = val1 + val2 + flag
            if val >= 10 {
                flag = 1
            }else{
                flag = 0
            }
            val = val%10
            
            node.next = ListNode(val)
            node = node.next!
            
            p = p?.next
            q = q?.next
        }
    
        return head.next
        
    }
}
