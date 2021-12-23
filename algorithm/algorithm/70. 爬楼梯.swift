//
//  70. 爬楼梯.swift
//  algorithm
//
//  Created by FU on 2021/12/23.
//

import Foundation
/*
 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。

 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？

 注意：给定 n 是一个正整数。

 示例 1：

 输入： 2
 输出： 2
 解释： 有两种方法可以爬到楼顶。
 1.  1 阶 + 1 阶
 2.  2 阶
 示例 2：

 输入： 3
 输出： 3
 解释： 有三种方法可以爬到楼顶。
 1.  1 阶 + 1 阶 + 1 阶
 2.  1 阶 + 2 阶
 3.  2 阶 + 1 阶

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/climbing-stairs
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
/*
 解析：
 动态规划 f(x) = f(x-1) + f(x-2)
 时间：O(n)
 空间：O(1)
 */

func climbStairs(_ n: Int) -> Int {
    var p = 0, q = 0, r = 1
    for _ in 1...n {
        p = q
        q = r
        r = p+q
    }
    return r
}

/*
 解析：
 递归 f(x) = f(x-1) + f(x-2)
 时间：O(2^n) 超出时间限制
 空间：O(1)
 */

func climbStairs1(_ n: Int) -> Int {
    if n == 1 { return 1}
    if n == 2 { return 2 }
    return climbStairs1(n-1) + climbStairs1(n-2)
}
