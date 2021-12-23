//
//  面试题 16.05. 阶乘尾数.swift
//  algorithm
//
//  Created by FU on 2021/12/23.
//

import Foundation

/*设计一个算法，算出 n 阶乘有多少个尾随零。

示例 1:

输入: 3
输出: 0
解释: 3! = 6, 尾数中没有零。
示例 2:

输入: 5
输出: 1
解释: 5! = 120, 尾数中有 1 个零.
说明: 你算法的时间复杂度应为 O(log n) 。

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/factorial-zeros-lcci
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/

/*
 解析：
 有0必然是 x * 10 = x * 2 * 5
 阶乘中 2.count > 5.count 所以 只需要获取5 的数量
 时间：O(logn)
 空间：O(1)
 */


func trailingZeroes(_ n: Int) -> Int {
    var ans = 0
    var n = n
    while n >= 5 {
        n = n/5
        ans += n
    }
    return ans
}
