//
//  Array.swift
//  algorithm
//
//  Created by 村上匡志 on 2023-05-12.
//

import Foundation


// Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
// Time complexity O(n^2)
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
  
  // check every two nums of the array if these nums are equal to the target.
  for i in 0..<nums.count {
    for j in (i + 1)..<nums.count {
      if nums[i] + nums[j] == target {
        return [i, j]
      }
    }
  }
  fatalError("Invalid input")
}

// Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once. The relative order of the elements should be kept the same. Then return the number of unique elements in nums.
func removeDuplicates(_ nums: inout [Int]) -> Int {
  if nums.isEmpty {
    return 0
  }
  
  // k will be a first Index of the array. and also k will be amount num of the array.
  var k = 0
  
  // k is the first index, that's why for starts from 1.
  for i in 1..<nums.count {
    if nums[i] != nums[k] {
      k += 1
      nums[k] = nums[i]
    }
  }
  return k + 1
}
