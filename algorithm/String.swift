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


func lengthOfLastWord(_ s: String) -> Int {
  // remove sapaces at the begining and end.
  let removeSpases = s.trimmingCharacters(in: .whitespacesAndNewlines)
  
  // saparete strings with spaces
  let word = removeSpases.components(separatedBy: " ")
  
  if let lastWord = word.last {
    return lastWord.count
  } else {
    return 0
  }
}


// Given two binary strings a and b, return their sum as a binary string. ex. a: 1010, b: 1011 -> 10101
func addBinary(_ a: String, _ b: String) -> String {
  // separete each num into a array
  let a = Array(a)
  let b = Array(b)
  
  var result = ""
  var carry = 0
  var i = a.count - 1
  var j = b.count - 1
  
  while i >= 0 || j >= 0 || carry > 0 {
    // That's important to assign the carry to the sum.
    var sum = carry
    
    if i >= 0 {
      sum += Int(String(a[i]))!
      i -= 1
    }
    if j >= 0 {
      sum += Int(String(b[j]))!
      j -= 1
    }
    carry = sum / 2        // determine if it is a carry or not.
    sum %= 2               // 
    result = String(sum) + result
  }
  return result
}


func isPalindrome(_ s: String) -> Bool {
  let remove1 = s.replacingOccurrences(of: " ", with: "")   // remove spaces
  let remove2 = String(remove1.filter{ $0.isLetter || $0.isNumber })  // remove non-alphanumeric characters
  let lowercase = remove2.lowercased()
  
  if String(lowercase.reversed()) == lowercase {
    return true
  }
  
  return false
}

// 1 -> A, 28 -> AB, 701 -> ZY
func convertToTitle(_ columnNumber: Int) -> String {
  var n = columnNumber
  var result = ""
  
  while n > 0 {
    n -= 1 // excel string code doesn't have 0. so n needs to be - 1
    let remainder = n % 26  // convret 10 hex to 26 hex
    let char = Character(UnicodeScalar(remainder + 65)!)  // convart index num that is added 65 to Character of Unicode
    result = String(char) + result // add it to the top of the result
    n /= 26 // divides n by 26 to get a next taget num
  }
  return result
}
