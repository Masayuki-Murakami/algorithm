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


func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
  // Initalaize k to count nums that are not equal to val
  var k = 0
  
  for i in 0..<nums.count {
    if nums[i] != val {
      // Overwrite nums[i] to nums[k] to remove nums[k] and raise num of k to count nums that aren;t equal and that num will be the next place to be substitute.
      nums[k] = nums[i]
      k += 1
    }
  }
  return k
}


func plusOne(_ digits: [Int]) -> [Int] {
  // copy the digits to change a element of the array. Because a parameter is let
  var digits = digits
  
  // check each element from the last if it is 9. if it is 9, return digits. Then finishs the function
  for i in (0..<digits.count).reversed() {
    if digits[i] == 9 {
      digits[i] = 0
    } else {
      digits[i] += 1
      return digits
    }
  }
  
  // if all of the elements are 9, insert 1 at first of the array
  digits.insert(1, at: 0)
  return digits
}

// numsRow: 5 -> [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]]
func generate(_ numRows: Int) -> [[Int]] {
  // define a two dimensional(二次元) array
  var result: [[Int]] = []
  
  for i in 0..<numRows {
    var currentRow: [Int] = []
    // append 1 to first num in an array
    currentRow.append(1)
    
    if i > 0 {
      let prevRow = result[i - 1]
      
      for j in 1..<prevRow.count {
        let sum = prevRow[j - 1] + prevRow[j]
        currentRow.append(sum)
      }
    }
    // if i is greater than 1, append 1 to the end of the currentRow
    if i >= 1 {
      currentRow.append(1)
    }
    result.append(currentRow)
  }
  return result
}


func getRow(_ rowIndex: Int) -> [Int] {
  var result: [[Int]] = []
  
  for i in 0..<(rowIndex + 1) {
    var currentRow: [Int] = []
    
    currentRow.append(1)
    
    if i > 0 {
      let prevRow = result[i - 1]
      
      for j in 1..<prevRow.count {
        let sum = prevRow[j - 1] + prevRow[j]
        currentRow.append(sum)
      }
    }
    if i >= 1 {
      currentRow.append(1)
    }
    result.append(currentRow)
  }
  
  return result.last!
}

func maxProfit(_ prices: [Int]) -> Int {
  // if assigned 0 in the minPrice, the value of minPrice never change. So it has to be sssigned first price as the minPrice appropriately
  var minPrice = Int.max
  var maxProfit = 0
  
  for price in prices {
    // first time assign the price as the minPrice. and renew the minPrice if a price is less then minPrice
    minPrice = min(minPrice, price)
    let profit = price - minPrice
    maxProfit = max(maxProfit, profit)
  }
  return maxProfit
}
