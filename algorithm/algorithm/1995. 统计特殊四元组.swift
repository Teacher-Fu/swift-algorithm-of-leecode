//
//  1995. 统计特殊四元组.swift
//  algorithm
//
//  Created by FU on 2021/12/29.
//

import Foundation
/*
 给你一个 下标从 0 开始 的整数数组 nums ，返回满足下述条件的 不同 四元组 (a, b, c, d) 的 数目 ：

 nums[a] + nums[b] + nums[c] == nums[d] ，且
 a < b < c < d
  

 示例 1：

 输入：nums = [1,2,3,6]
 输出：1
 解释：满足要求的唯一一个四元组是 (0, 1, 2, 3) 因为 1 + 2 + 3 == 6 。
 示例 2：

 输入：nums = [3,3,6,4,5]
 输出：0
 解释：[3,3,6,4,5] 中不存在满足要求的四元组。
 示例 3：

 输入：nums = [1,1,1,3,5]
 输出：4
 解释：满足要求的 4 个四元组如下：
 - (0, 1, 2, 3): 1 + 1 + 1 == 3
 - (0, 1, 3, 4): 1 + 1 + 3 == 5
 - (0, 2, 3, 4): 1 + 1 + 3 == 5
 - (1, 2, 3, 4): 1 + 1 + 3 == 5
  

 提示：

 4 <= nums.length <= 50
 1 <= nums[i] <= 100

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/count-special-quadruplets
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

/*
 解析：
 1.暴力法
 4层遍历
 时间：O(n^4)
 空间：O(1)
 */

func countQuadruplets(_ nums: [Int]) -> Int {
    let size = nums.count
    var ans = 0
    for a in 0..<size {
        for b in (a+1)..<size {
            for c in (b+1)..<size {
                for d in (c+1)..<size {
                    if nums[a] + nums[b] + nums[c] == nums[d] {
                        ans += 1
                    }
                }
            }
        }
    }
    return ans
}

/*
 解析：
 2.使用哈希表存储 nums[d]
 map[nums[a] + nums[b] + nums[c]] 中的数量
 时间：O(n^2)
 空间：O(min(n,C)) 其中 C 是数组 nums 中的元素范围
 */

func countQuadruplets1(_ nums: [Int]) -> Int {
    let size = nums.count
    var ans = 0
    var map: [Int: Int] = [:]
    for c in (2...size-2).reversed() {
        map[c+1] = (map[c+1] ?? 0) + 1
        for a in 0..<c {
            for b in (a+1)..<c {
                ans += map[nums[a] + nums[b] + nums[c]] ?? 0
            }
        }
    }
    return ans
}

/*
 解析：
 2.使用哈希表存储
 时间：O(n^2) nums[d] - nums[c]
 map[nums[a] + nums[b]] 中的数量
 空间：O(min(n,C)^2) 其中 C 是数组 nums 中的元素范围
 */

func countQuadruplets2(_ nums: [Int]) -> Int {
    let size = nums.count
    var ans = 0
    var map: [Int: Int] = [:]
    for b in (1...size-3).reversed() {
        for d in (b+2)..<size {
            map[nums[d] - nums[b+1]] = map[nums[d] - nums[b+1], default: 0] + 1
        }
        for a in 0..<b {
            ans += map[nums[a] + nums[b], default: 0]
        }
    }
    return ans
}
