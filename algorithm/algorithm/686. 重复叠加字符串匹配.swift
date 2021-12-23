//
//  686. 重复叠加字符串匹配.swift
//  algorithm
//
//  Created by FU on 2021/12/22.
//

import Foundation


/*给定两个字符串 a 和 b，寻找重复叠加字符串 a 的最小次数，使得字符串 b 成为叠加后的字符串 a 的子串，如果不存在则返回 -1。

注意：字符串 "abc" 重复叠加 0 次是 ""，重复叠加 1 次是 "abc"，重复叠加 2 次是 "abcabc"。

 

示例 1：

输入：a = "abcd", b = "cdabcdab"
输出：3
解释：a 重复叠加三遍后为 "abcdabcdabcd", 此时 b 是其子串。
示例 2：

输入：a = "a", b = "aa"
输出：2
示例 3：

输入：a = "a", b = "a"
输出：1
示例 4：

输入：a = "abc", b = "wxyz"
输出：-1
 

提示：

1 <= a.length <= 104
1 <= b.length <= 104
a 和 b 由小写英文字母组成

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/repeated-string-match
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

/*
 解析：
 由题目可知 a 翻转后的长度 >= b
 a的前缀不相等的长度 + 后面的长度 >= b
 b 无法从第一个叠加的 a 开始匹配成功 既 newa.count >= b.count + a.count 还没有找到就是 -1
 字符串匹配 直接 kmp
 时间：O(n+m)
 空间：O(1)
 */


func repeatedStringMatch(_ a: String, _ b: String) -> Int {
    let bCount = b.count
    
    var tes = ""
    var res = 0
    while tes.count <= bCount + a.count {
        res += 1
        tes.append(contentsOf: a)
        if tes.count < bCount {
            continue
        }
        if tes.contains(b) {
            return res
        }
    }
    return -1
}
