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

print(generate(5))

print(getRow(3))

print(maxProfit([7,1,5,3,6,4]))

print(singleNumber([4,1,2,1,2]))

print(containsNearbyDuplicate([1,2,3,1], 3))

print(summaryRanges([0,1,2,4,5,7]))

var num2 = [0,1,0,3,12]
print(moveZeroes(&num2))

print("----------(String)----------")

print(romanToInt("MCMXCIV"))

var strs = ["flower","flow","flight"]
print(longestCommonPrefix(strs))

print(isValid("()[]{}"))

print(strStr("abcdef", "ef"))

print(lengthOfLastWord(" Hello World "))

print(addBinary("11", "1"))

print(isPalindrome("`l;`` 1o1 ??;l`"))

print(titleToNumber("AB"))


print("----------(Sort)----------")

var sortNum = [1,2,3,0,0,0]
merge(&sortNum, 3, [2,5,6], 3)
print(sortNum)

print(majorityElement([2,2,1,1,1,2,2]))

print(containsDuplicate([1,2,3,1]))

print(isAnagram("anagram", "nagaram"))

print(intersectionOneLine([1,2,2], [3,2,3]))

print(intersect([4,9,5], [9,4,9,8,4]))

print(findTheDifference("abcd", "abcde"))

print(thirdMax([3,2,1]))

print(findContentChildren([1,2], [1,2,3]))

print(findRelativeRanks([10,3,8,9,4]))

print(arrayPairSum([1,4,3,2]))

print("----------(BinarySearch)----------")

print(searchInsert([1,3,5,6], 2))

print(mySqrt(8))

print(missingNumber([0,1,2,4,5]))

print(isPerfectSquare(16))

print(arrangeCoins(5))

print(search([-1,0,3,5,9,12], 9))

print(nextGreatestLetter(["c","f","j"], "c"))

print(fairCandySwap([1,1], [2,2]))

print("----------(Recursion)----------")

testCase1mergeTwoLists()
print("--")
testCase2removeElements()
print("--")
testCase3reverseList()
print("--")
print(isPowerOfTow(16))
print("--")
testCase3isPalindrome()
print("--")
print(isPowerOfThree(27))
print(isPowerOfFour(16))
