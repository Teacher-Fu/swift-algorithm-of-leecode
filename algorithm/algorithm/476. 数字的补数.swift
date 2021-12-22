//
//  476. 数字的补数.swift
//  algorithm
//
//  Created by FU on 2021/12/21.
//

import Foundation

/*
 对整数的二进制表示取反（0 变 1 ，1 变 0）后，再转换为十进制表示，可以得到这个整数的补数。

 例如，整数 5 的二进制表示是 "101" ，取反后得到 "010" ，再转回十进制表示得到补数 2 。
 给你一个整数 num ，输出它的补数。

  

 示例 1：

 输入：num = 5
 输出：2
 解释：5 的二进制表示为 101（没有前导零位），其补数为 010。所以你需要输出 2 。
 示例 2：

 输入：num = 1
 输出：0
 解释：1 的二进制表示为 1（没有前导零位），其补数为 0。所以你需要输出 0 。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/number-complement
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

/*
 解析：
 获取num的最高位 用最高位左移一位-1 异或 num 得到答案
 时间：O(1)
 空间：O(1)
 */


func findComplement(_ num: Int) -> Int {
    var highBit = 0
    for i in 1..<31 {
        if num >= (1 << i) {
            highBit = i
        } else {
            break
        }
    }
    let mask = highBit == 30 ? 0x7fffffff : (1 << (highBit + 1)) - 1
    return num ^ mask
}
