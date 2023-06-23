//
//  Recursion.swift
//  algorithm
//
//  Created by 村上匡志 on 2023-05-18.
//

import Foundation

// val is first node in a list. And the next is the next node in a list.
// Since the next is a ListNode type, each next is linked and can refer to the next val.
// To access a list, one needs to get a first node.
// ex) ListNode(val: 1, next: Optional(LiatNode(val: 2, next: Optional(ListNode(val: 4, next: nil))))) list1: 1 -> 2 -> 4 -> nil
public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
  // get a first node two of nodes as node1 and node2
  // Recursion must have closiong statement.
  guard let node1 = list1 else {
    return list2
  }
  
  guard let node2 = list2 else {
    return list1
  }
  
  // Recursively compre each node and return the node that has a next node and can refer to the next node.
  if node1.val <= node2.val {
    node1.next = mergeTwoLists(node1.next, list2)
    return node1
  } else {
    node2.next = mergeTwoLists(list1, node2.next)
    return node2
  }
}

func testCase1mergeTwoLists() {
  let list1 = ListNode(1)
  list1.next = ListNode(2)
  list1.next?.next = ListNode(4)
  
  let list2 = ListNode(1)
  list2.next = ListNode(3)
  list2.next?.next = ListNode(4)
  
  let mergedList = mergeTwoLists(list1, list2)
  
  var node = mergedList
  while node != nil {
    print(node!.val)
    node = node!.next
  }

}

func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
  guard let head = head else {
    return nil
  }
  
  // If the value of head is the same as val, delete it by rewriting its head to the next node.
  if head.val == val {
    return removeElements(head.next, val)
  }
  
  // if it is not the same, skip the node to the next node.
  head.next = removeElements(head.next, val)
  
  return head
}

func testCase2removeElements() {
  let head = ListNode(1)
  head.next = ListNode(2)
  head.next?.next = ListNode(6)
  head.next?.next?.next = ListNode(3)
  head.next?.next?.next?.next = ListNode(4)
  head.next?.next?.next?.next?.next = ListNode(5)
  head.next?.next?.next?.next?.next?.next = ListNode(6)

  let val = 6

  let result = removeElements(head, val)

  var node = result
  while node != nil {
    print(node!.val)
    node = node!.next
  }

}

// [1,2,3,4] -> [4,3,2,1]
func reverseList(_ head: ListNode?) -> ListNode? {
  guard let head = head else {
    return head
  }
  // get the head.next until head is nil or head.next is nil. store a val in a stack and assign the last val as the revercedHead.
  // In this proces, the list will be reversed. ex. [1,2,3,4] -> [4,3,2]
  // The reason why a list will be reversed is that each value will be stored in a stack and taken from the top.
  let revercedHead = reverseList(head.next)
  
  // need to change the pointer of the head to the head and set the head.next to nil. ex. 1->2 / 2<-1->nil
  head.next?.next = head
  head.next = nil
  
  return revercedHead ?? head
}

func testCase3reverseList() {
  let head = ListNode(1)
  head.next = ListNode(2)
  head.next?.next = ListNode(3)
  head.next?.next?.next = ListNode(4)
  head.next?.next?.next?.next = ListNode(5)
  
  let result = reverseList(head)
  
  var node = result
  while node != nil {
    print(node!.val)
    node = node!.next
  }
}


func isPowerOfTow(_ n: Int) -> Bool {
  if n <= 0 {
    return false
  }
  
  return helperPowerOfTwo(n)
}

private func helperPowerOfTwo(_ num: Int) -> Bool {
  if num == 1 {
    return true
  }
  
  if num % 2 == 0 {
    return helperPowerOfTwo(num / 2)
  }
  
  return false
}

var pointer: ListNode?

func isPalindrome(_ head: ListNode?) -> Bool {
  // hold a original node list
  pointer = head
  return helperIsPalindrome(head)
}

// 1. It is called recursively until Next becomes nil and starts backtracking. In other words, it goes back to the node one node before.
// 2. it checks to see if he values the two nodes match while setting pointer to next.
func helperIsPalindrome(_ currentNode: ListNode?) -> Bool {
  if currentNode != nil {
    // 1.
    if !helperIsPalindrome(currentNode?.next) {
      return false
    }
    // 2.
    if pointer?.val != currentNode?.val {
      return false
    }
    pointer = pointer?.next
  }
  return true
}

func testCase3isPalindrome() {
  let head = ListNode(1)
  head.next = ListNode(2)
  head.next?.next = ListNode(2)
  head.next?.next?.next = ListNode(1)
  
  let result = isPalindrome(head)
  
  print(result)
}

func isPowerOfThree(_ n: Int) -> Bool {
  if n == 0 {  // if n == 0, 0 can't be powewr of three. do return false
    return false
  } else if n == 1 { // n == 1, it's power of three
    return true
  } else {
    // if the remainder of 3 divided by n is 0, the n is power of three. it means n can be poewr of three
    // so divide n by 3 and check if the result is power of three recursively
    return n % 3 == 0 && isPowerOfThree(n / 3)
  }
//  return n > 0 && (n == 1 || n % 3 == 0 && isPowerOfThree(n / 3))
}

func isPowerOfFour(_ n: Int) -> Bool {
  if n == 0 {
    return false
  } else if n == 1 {
    return true
  } else {
    return n % 4 == 0 && isPowerOfFour(n / 4)
  }
}
