//
//  Sorting.swift
//  algorithm
//
//  Created by 村上匡志 on 2023-05-16.
//

import Foundation

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
  // difine the last nums of m and n and sum of m and n. The sum will be the result. Store each num in the sum.
  var last1 = m - 1
  var last2 = n - 1
  var sum = m + n - 1
  
  while last1 >= 0 && last2 >= 0 {
    // if nums1[last1] is greater than nums2[last2], store the num(nums1[last1]) in the sum. And change the last num to the next num.
    if nums1[last1] > nums2[last2] {
      nums1[sum] = nums1[last1]
      last1 -= 1
    } else {
      // else store the num(nums2[last2) in the sum. Ane change the last num to the next num.
      nums1[sum] = nums2[last2]
      last2 -= 1
    }
    // to keep the num(s) change the pointer to the next.
    sum -= 1
  }
  
  // if nums1 is less than 0, this code is needed.
  while last2 >= 0 {
    nums1[sum] = nums2[last2]
    last2 -= 1
    sum -= 1
  }
}


func majorityElement(_ nums: [Int]) -> Int {
  var majority = nums[0] // Set a tentative(暫定的な) majority element
  var count = 1 // initalize number of times the majority element appears
  
  for i in 1..<nums.count {
    // if the majority and nums[i] is equal, count += 1.
    if majority == nums[i] {
      count += 1
    } else {
      count -= 1 // if these elements aren't equal, count -= 1
      // if the count == 0, reset the majority to nums[i] and the count to 1
      if count == 0 {
        majority = nums[i]
        count = 1
      }
    }
  }
  return majority
}


// Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.
func containsDuplicate(_ nums: [Int]) -> Bool {
  // define a new set to store unique num.
  var set = Set<Int>()
  
  for num in nums {
    // if the set has the same num as num of nums, return true
    if set.contains(num) {
      return true
    } else {
      // else insert the num to the set
      set.insert(num)
    }
  }
  return false
}

func isAnagram(_ s: String, _ t: String) -> Bool {
  // make each sorted String. the sorted method make a string in order base on Unicode. It means s: anagram, t: nagaram -> "aagmnr"
  let sortedS = s.sorted()
  let sortedT = t.sorted()
  
  return sortedS == sortedT
}

// nums1: [1,2,2], nums2: [2,3,4] -> [2]
func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
  let set1 = Set(nums1)
  let set2 = Set(nums2)
  // Returns a new set with the elements that are common to both this set and the given sequence.
  let intersectionSet = set1.intersection(set2)
  
  return Array(intersectionSet)
}

func intersectionOneLine(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
  Array(Set(nums1).intersection(Set(nums2)))
}


func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
  let sorted1 = nums1.sorted() // [1,2,2,1] -> [1,1,2,2]
  let sorted2 = nums2.sorted() // [9,4,9,8] -> [4,8,9,9]
  
  var intersect: [Int] = []
  
  var i = 0
  var j = 0
  // continues the while loop while both of the array are greater than i or j
  while i < sorted1.count && j < sorted2.count {
    // if sorted2 is greater than sorted1, switch the target to the next. else if is the same.
    if sorted1[i] < sorted2[j] {
       i += 1
    } else if sorted1[i] > sorted2[j] {
      j += 1
    } else {
      // if sorted1 == sorted2, append the element to the intersect. And switch both of the target to the next.
      intersect.append(sorted1[i])
      i += 1
      j += 1
    }
  }
  
  return intersect
}


func findTheDifference(_ s: String, _ t: String) -> Character {
  // difine a dictonary to store each value and a count num of the same chracter of the each string
  var charCount: [Character: Int] = [:]
  
  for char in s {
    // assign each character of s and count the number of apperarances as a value of the dictionary
    charCount[char, default: 0] += 1
  }
  
  for char in t {
    // if t has the same character in the dictionary, the key's value -1. and if a value of key is 0, remove it.
    charCount[char, default: 0] -= 1
    if charCount[char] == 0 {
      charCount[char] = nil
    }
  }
  
  return charCount.keys.first!
}

func thirdMax(_ nums: [Int]) -> Int {
  // create a new array wiht unique elements, sorted by nums in descending order
  let sortedNums = Array(Set(nums)).sorted(by: >)
  // if the sortedNums is less than 3, return the max num in the sortedNums
  if sortedNums.count < 3 {
    return sortedNums.max()!
  }
  // return third max num
  return sortedNums[2]
}

func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
  let children = g.sorted()
  let cookies = s.sorted()
  
  var i = 0, j = 0
  
  // while children and cookies are not empty, continue the loop
  while i < children.count && j < cookies.count {
    // if cookie size is greater than greedy of the child, move to next child. ex. cookies[i(1)] >= children[i(1)] -> true. 
    if cookies[j] >= children[i] {
      i += 1
    }
    j += 1
  }
  
  return i
}


func findRelativeRanks(_ score: [Int]) -> [String] {
  var scoreToIndex = [Int: Int]()
  for (index, value) in score.enumerated() {
    // store original index as a value and original score as a key
    scoreToIndex[value] = index
  }
  
  let sortedScores = score.sorted(by: >) // sort each score in desending order
  var result = [String](repeating: "", count: score.count) // difine a array that has empty value which have a index.
  
  // rewrite the score to string
  for (rank, score) in sortedScores.enumerated() {
    switch rank {
    case 0:
      result[scoreToIndex[score]!] = "Gold Medal"  // asign each score to the result at the same index between scoreToIndex to result
    case 1:
      result[scoreToIndex[score]!] = "Silver Medal"
    case 2:
      result[scoreToIndex[score]!] = "Bronze Medal"
    default:
      result[scoreToIndex[score]!] = "\(rank + 1)"
    }
  }
  
  return result
}

// Only an even num of the stored array is put into the sum. and return the sum
// In a sorted array, even nums are smaller than thire neibors, so satisfying the requirement of the problem of adding up the minimum value of each pair.
func arrayPairSum(_ nums: [Int]) -> Int {
  let sorted = nums.sorted()
  var sum = 0
  
  for i in 0..<sorted.count {
    if i % 2 == 0 {
      sum += sorted[i]
    }
  }
  return sum
}
