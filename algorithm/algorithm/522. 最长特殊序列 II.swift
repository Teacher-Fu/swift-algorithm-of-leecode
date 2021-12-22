//
//  522. 最长特殊序列 II.swift
//  algorithm
//
//  Created by FU on 2021/12/21.
//

import Foundation
/*
 给定字符串列表，你需要从它们中找出最长的特殊序列。最长特殊序列定义如下：该序列为某字符串独有的最长子序列（即不能是其他字符串的子序列）。

 子序列可以通过删去字符串中的某些字符实现，但不能改变剩余字符的相对顺序。空序列为所有字符串的子序列，任何字符串为其自身的子序列。

 输入将是一个字符串列表，输出是最长特殊序列的长度。如果最长特殊序列不存在，返回 -1 。

  

 示例：

 输入: "aba", "cdc", "eae"
 输出: 3
  

 提示：

 所有给定的字符串长度不会超过 10 。
 给定字符串列表的长度将在 [2, 50 ] 之间。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-uncommon-subsequence-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

/*
 解析：
 语文不好的题目就是一个困难题无从下手。
 题目主要是表达 给定的字符串数组中 是否有字符串 是其他字符串 唯一的子字符串 有就返回最长的 没有返回-1
 1.先写一个方法判断两个字符串 是否是期中一个字符串的子字符串
 2.遍历字符串数组， 取字符串与字符串数组中的每一个字符串比对是否是其子序列
 优化： 先把字符串数组长度排序 后再遍历 按降序排列之后，遍历过程中，以前遍历x*n^2 现在 nlogn(排序) + 找出最大特殊子字符串的长度的时间最坏O(x*n^2)
 时间：O(x*n^2) n为字符串的数量 x是每个字符串的平均长度
 空间：O(1)
 */


func findLUSlength(_ strs: [String]) -> Int {
        
    // str1 是 str2 的子字符串吗
    func isSubsequence(_ str1: String, _ str2: String) -> Bool {
        var same = 0
        for i in 0..<str2.count {
            if same == str1.count {
                break
            }
            let index1 = str1.index(str1.startIndex, offsetBy: same)
            let index2 = str2.index(str2.startIndex, offsetBy: i)
            if str1[index1...index1] == str2[index2...index2] {
                same += 1
            }
        }
        return same == str1.count
    }
    
    let strs = strs.sorted { s1, s2 in
        return s1.count > s2.count
    }
    for i in 0..<strs.count {
        var flag = true
        for j in 0..<strs.count {
            if i == j { continue }
            if isSubsequence(strs[i],strs[j]) {
                flag = false
                break
            }
        }
        if flag {
            return strs[i].count
        }
    }
    return -1
    
}


