//
//  1154. 一年中的第几天.swift
//  algorithm
//
//  Created by FU on 2021/12/21.
//

import Foundation

/*
 给你一个字符串 date ，按 YYYY-MM-DD 格式表示一个 现行公元纪年法 日期。请你计算并返回该日期是当年的第几天。

 通常情况下，我们认为 1 月 1 日是每年的第 1 天，1 月 2 日是每年的第 2 天，依此类推。每个月的天数与现行公元纪年法（格里高利历）一致。

  

 示例 1：

 输入：date = "2019-01-09"
 输出：9
 示例 2：

 输入：date = "2019-02-10"
 输出：41
 示例 3：

 输入：date = "2003-03-01"
 输出：60
 示例 4：

 输入：date = "2004-03-01"
 输出：61
  

 提示：

 date.length == 10
 date[4] == date[7] == '-'，其他的 date[i] 都是数字
 date 表示的范围从 1900 年 1 月 1 日至 2019 年 12 月 31 日

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/day-of-the-year
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
/*
 解析：
 1.列举每个月的天数
 2.将日期字符串转变为数组获取日月年
 3.判断闰年与否，修改闰年每月天数
 3.遍历月份获取天数，加上本来的天数得到总天数
 时间：O(1)
 空间：O(1)
 */

func dayOfYear(_ date: String) -> Int {
    var res = 0, monthArr = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    let time = date.split(separator: "-")
    let y = Int(time[0])!, m = Int(time[1])!, d = Int(time[2])!
    // 润年 1、能被4整除，但不能被100整除；2、能被400整除；
    if y % 400 == 0 || (y % 4 == 0 && y % 100 != 0) {
        monthArr[1] = 29
    }
    
    for i in 0 ..< m - 1 {
        res += monthArr[i]
    }
    return res + d
}
