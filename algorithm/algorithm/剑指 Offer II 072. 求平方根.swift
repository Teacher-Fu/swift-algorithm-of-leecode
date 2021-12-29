//
//  剑指 Offer II 072. 求平方根.swift
//  algorithm
//
//  Created by FU on 2021/12/29.
//

import Foundation

/*
 给定一个非负整数 x ，计算并返回 x 的平方根，即实现 int sqrt(int x) 函数。

 正数的平方根有两个，只输出其中的正数平方根。

 如果平方根不是整数，输出只保留整数的部分，小数部分将被舍去。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/jJ0w9p
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 示例 1:

 输入: x = 4
 输出: 2
 示例 2:

 输入: x = 8
 输出: 2
 解释: 8 的平方根是 2.82842...，由于小数部分将被舍去，所以返回 2
  

 提示:

 0 <= x <= 231 - 1

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/jJ0w9p
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 注意：本题与主站 69 题相同： https://leetcode-cn.com/problems/sqrtx/

 */


/*
 解析：
 二分法遍历获取该数字 m 与 x/m的大小 得出该数字
 时间：O(logx)
 空间：O(1)
 */


func mySqrt(_ x: Int) -> Int {
    
    var left = 1
    var right = x
    while left <= right {
        let mid = left + ((right-left) >> 1)
        if mid > x/mid {
            right = mid - 1
        } else {
            if (mid+1) > x/(mid+1) {
                return mid
            }
            left = mid + 1
        }
    }
    return 0
}
