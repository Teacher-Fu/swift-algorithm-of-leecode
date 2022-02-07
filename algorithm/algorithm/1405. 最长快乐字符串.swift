//
//  1405. 最长快乐字符串.swift
//  algorithm
//
//  Created by FU on 2022/2/7.
//

import Foundation

/*
 如果字符串中不含有任何 'aaa'，'bbb' 或 'ccc' 这样的字符串作为子串，那么该字符串就是一个「快乐字符串」。

 给你三个整数 a，b ，c，请你返回 任意一个 满足下列全部条件的字符串 s：

 s 是一个尽可能长的快乐字符串。
 s 中 最多 有a 个字母 'a'、b 个字母 'b'、c 个字母 'c' 。
 s 中只含有 'a'、'b' 、'c' 三种字母。
 如果不存在这样的字符串 s ，请返回一个空字符串 ""。

  

 示例 1：

 输入：a = 1, b = 1, c = 7
 输出："ccaccbcc"
 解释："ccbccacc" 也是一种正确答案。
 示例 2：

 输入：a = 2, b = 2, c = 1
 输出："aabbc"
 示例 3：

 输入：a = 7, b = 1, c = 0
 输出："aabaa"
 解释：这是该测试用例的唯一正确答案。
  

 提示：

 0 <= a, b, c <= 100
 a + b + c > 0

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-happy-string
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

/*
 解析：
 贪心 从最多的字母开始排列 每次最对排列两个相同的 然后再次排列数量 重新排列
 时间：O(a+b+c)
 空间：O(1)
 */



func longestDiverseString(_ a: Int, _ b: Int, _ c: Int) -> String {
   
    var arr = [Pair(key: a, value: "a"),Pair(key: b, value: "b"),Pair(key: c, value: "c")]
    var res = ""
    while true {
        arr = arr.sorted { i, j in
            return i.key > j.key
        }
        
        var hasNext = false
        
        for i in 0..<arr.count {
            let item = arr[i]
            if item.key <= 0 {
                break
            }
            let count = res.count
            lazy var position1 = res.index(res.startIndex, offsetBy: count-2)
            lazy var position2 = res.index(res.startIndex, offsetBy: count-1)
            if count >= 2 && res[position1] == item.value && res[position2] == item.value {
                continue
            }
            hasNext = true
            res.append(item.value)
            arr[i].key -= 1
            break
        }
        if !hasNext {
            break
        }
    }
    return res
}

fileprivate class Pair {
    var key: Int
    var value: Character
        
    init(key: Int, value: Character) {
        self.key = key
        self.value = value
    }
}
