//
//  main.swift
//  algorithm
//
//  Created by 村上匡志 on 2023-05-12.
//

import Foundation

print("----------(Array)----------")

print(twoSum([2, 7, 5, 8], 9))

var num = [0,0,1,1,1,2,2,3,3,4]
print(removeDuplicates(&num))

print(removeElement(&num, 2))

print(plusOne([1,2,3,4]))


print("----------(String)----------")

print(romanToInt("MCMXCIV"))

var strs = ["flower","flow","flight"]
print(longestCommonPrefix(strs))

print(isValid("()[]{}"))

print(strStr("abcdef", "ef"))


print("----------(Sort)----------")

var sortNum = [1,2,3,0,0,0]
merge(&sortNum, 3, [2,5,6], 3)
print(sortNum)

print(majorityElement([2,2,1,1,1,2,2]))

print("----------(BinarySearch)----------")

print(searchInsert([1,3,5,6], 2))

print(mySqrt(8))

print("----------(Recursion)----------")

testCase1mergeTwoLists()
print("--")
testCase2removeElements()

