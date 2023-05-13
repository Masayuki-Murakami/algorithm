//
//  String.swift
//  algorithm
//
//  Created by 村上匡志 on 2023-05-13.
//

import Foundation

func romanToInt(_ s: String) -> Int {
  let romanToInteger: [Character: Int] = [
    "I": 1,
    "V": 5,
    "X": 10,
    "L": 50,
    "C": 100,
    "D": 500,
    "M": 1000
  ]
  
  var result = 0
  var prev = 0
  
  // check a character right to left 
  for char in s.reversed() {
    // get a value of a character of a char
    if let value = romanToInteger[char] {
      // compare with the value and the previous number. and if the value greater than prev result += value. if it is not, result -= value.
      if value >= prev {
        result += value
      } else {
        result -= value
      }
      // turn the value to previous num.
      prev = value
    }
    
  }
  return result
}


func longestCommonPrefix(_ strs: [String]) -> String {
  // if strs is empty return empty string
  guard let firstStr = strs.first else {
    return ""
  }
  
  // Initalaize a first string as a prefix
  var prefix = firstStr
  
  // find a common prefix from the rest of the strings
  for i in 1..<strs.count {
    
    // if the string dosen't contain the prefix, remove the last character form the prefix until finding a common prefix or prefix is empty.
    while !strs[i].hasPrefix(prefix) {
      prefix.removeLast()
      
      if prefix.isEmpty {
        return ""
      }
    }
  }
  return prefix
}
