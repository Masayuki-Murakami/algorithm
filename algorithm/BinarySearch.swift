//
//  BinarySearch.swift
//  algorithm
//
//  Created by 村上匡志 on 2023-05-17.
//

import Foundation
// nums: [1,3,5,6], target: 2
func searchInsert(_ nums: [Int], _ target: Int) -> Int {
  var left = 0
  var right = nums.count - 1
  
  // left <= right this code means all of the nums after left are only bigger nums than left and lower nums then left.
  while left <= right {
    let mid = (left + right) / 2
    
    if mid == target {
      return mid
    } else if nums[mid] < target { // if nums[mid] < target, reduce the search erea to right half
      left = mid + 1
    } else {                       // if it is not, reduce the search erea to left half
      right = mid - 1
    }
  }
  // if it dosen't mach, return left. When left is grater than right, it means before the right is the sutable area for the target to be inserted.
  // because th nums before the left are only less then left and after the left are more the left. that's why the left is the sutable area.
  return left
}

func mySqrt(_ x: Int) -> Int {
  if x == 1 || x == 0 {
    return x
  }
  
  var left = 0
  var right = x
  
  while left <= right {
    let mid = (left + right) / 2
    let squere = mid * mid
    
    if squere == x {
      return mid
    } else if squere < x {
      left = mid + 1
    } else {
      right = mid - 1
    }
  }
  // In this case the decimal point(小数点) must be rounded down. So return left - 1.
  return left - 1
}

// Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.
func missingNumber(_ nums: [Int]) -> Int {
  let n = nums.count
  let expectedSum = n * (n + 1) / 2 // Get a expectedSum  ex. 0,1,2,4 -> 10
  let actualSum = nums.reduce(0, +) // Get a actualSum using reduce method  ex. 0 + 1 + 2 + 4 = 7
  return expectedSum - actualSum
}


//func firstBadVersion(_ n: Int) -> Int {
//  var left = 1
//  var right = n
//
//  while left <= right {
//    var mid = (left + right) / 2
//
//    // if isBadVersion is true, it means the versions after the mid are all bad version. if it is false, the versions before mid are all good version.
//    if isBadVersion(mid) {
//      right = mid - 1
//    } else {
//      left = mid + 1
//    }
//  }
//  return left
//}
