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
