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
