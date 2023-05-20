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

// Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
func isValid(_ s: String) -> Bool {
  
  var stack: [Character] = []
  let map: [Character: Character] = [")": "(", "]": "[", "}": "{"]
  
  for char in s {
    // if char is equal to key of the map, it will be true. And assign a value of the map to the openingBracket.
    if let openingBracket = map[char] {
      if stack.isEmpty || stack.last != openingBracket { // if the stack is not empty and not equal to the last element of stack, return false.
        return false
      }
      stack.removeLast() // if the value of map is equal to last element of the stack, remove the last element in the stack.
    } else {
      // if the char isn't closing bracket, append it to stack to check the next element if it is closing bracket.
      stack.append(char)
    }
  }
  // if there is no element in the stack, return true.
  return stack.isEmpty
}

// Given two strings needle and haystack, return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
func strStr(_ haystack: String, _ needle: String) -> Int {
  let n = haystack.count
  let m = needle.count
  
  if m == 0 { return 0 }
  
  if n < m { return -1 }
  
  // Narrow the scope so this code doesn't need compre haystack with needle all the way to the end.
  // Because if it can't find the index until the end(n-m), it means these strings are not equal.
  for i in 0...(n - m) {
    // Get a substring that is the same as long as needle until find the same string. if it can't find it, return -1
    let substring = haystack[haystack.index(haystack.startIndex, offsetBy: i)..<haystack.index(haystack.startIndex, offsetBy: i + m)]
    
    if substring == needle {
      return i
    }
  }
  return -1
}
