//
//  0475. 供暖器.swift
//  algorithm
//
//  Created by yasuo on 2021/12/20.
//

import Foundation

/*
 冬季已经来临。 你的任务是设计一个有固定加热半径的供暖器向所有房屋供暖。

 在加热器的加热半径范围内的每个房屋都可以获得供暖。

 现在，给出位于一条水平线上的房屋 houses 和供暖器 heaters 的位置，请你找出并返回可以覆盖所有房屋的最小加热半径。

 说明：所有供暖器都遵循你的半径标准，加热的半径也一样。

  

 示例 1:

 输入: houses = [1,2,3], heaters = [2]
 输出: 1
 解释: 仅在位置2上有一个供暖器。如果我们将加热半径设为1，那么所有房屋就都能得到供暖。
 示例 2:

 输入: houses = [1,2,3,4], heaters = [1,4]
 输出: 1
 解释: 在位置1, 4上有两个供暖器。我们需要将加热半径设为1，这样所有房屋就都能得到供暖。
 示例 3：

 输入：houses = [1,5], heaters = [2]
 输出：3
  

 提示：

 1 <= houses.length, heaters.length <= 3 * 104
 1 <= houses[i], heaters[i] <= 109

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/heaters
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
    
/*
 解析:
 二分查找 + 排序
 1.供暖器并未排序，先对供暖器排序
 2.遍历 houses 找出每个house最近的供暖器（排序供暖器 二分查找） 此时的半径为供暖器 到 house 的距离
 3.比较该距离与最大半径的距离取最大

 时间复杂度O((n+m)logn)
 空间复杂度O(logn) 其中 n 是数组 heaters 的长度。空间复杂度主要取决于排序所需要的空间。
 */
func findRadius(_ houses: [Int], _ heaters: [Int]) -> Int {
    func binarySearch(_ houses: Int, _ heaters: [Int]) -> Int {
        var left = 0
        var right = heaters.count - 1
        if heaters[left] > houses {
            return -1
        }
        while left < right {
            let mid = (right - left + 1) / 2 + left
            if heaters[mid] > houses {
                right = mid - 1;
            } else {
                left = mid
            }
        }
        return left
    }
    
    var ans = 0
    let heaters = heaters.sorted()
    for house in houses {
        let i = binarySearch(house, heaters)
        let j = i + 1
        let leftDistance = i < 0 ? Int.max : house - heaters[i]
        let rightDistance = j >= heaters.count ? Int.max : heaters[j] - house
        let curDistance = min(leftDistance, rightDistance)
        ans = max(ans, curDistance)
    }
    return ans
}


