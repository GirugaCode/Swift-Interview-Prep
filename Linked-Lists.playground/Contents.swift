import Foundation

public struct LinkedList<T> {
    public var head: Node?
    public var tail: Node?
    
    public init() {}
    
    public var isEmpty: Bool {
        return head == nil
    }
    /**
    Adding value at the beginning of the list (head-first insertion).
     
    - Parameters:
        - value: The data that is stored within the node
     
     Time Complexity:
     O(1) Constant time since we are just assigning the head at the beginning of the linked list
    */
    public mutating func push(_ value: Int) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head // In case of an empty list
        }
    }
    
    /**
     Adds a value at the end of the list (tail-end insertion).
     
    - Parameters:
        - value: The data that is stored within the node
     
     Time Complexity:
     O(1) Constant time since we are just assigning to the tail of the linked list
    */
    public mutating func append(_ value: Int) {
        guard !isEmpty else {
            push(value)
            return
        }
        tail!.next = Node(value: value )
        tail = tail!.next
    }
    
    /**
     Finds the node given the index and iterates itself on the linked list
     
    - Parameters:
        - index: The index position that the node is located
     
     Time Complexity:
     O(n) where n is the number of times we have to iterate through the linked list
    */
    public func node(at index: Int) -> Node? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        return currentNode
    }
    
    /**
     Inserts a value in a specific place in the list.
     Finds the node then inserts the new node.
    - Parameters:
        - value: The data that is stored within the node
        - node: A new instance of a node class
     
     Time Complexity:
     O(n) where n is the number of times we go through each item in the list to find where we would insert the node atwa
    */
    @discardableResult public mutating func insert(_ value: Int, after node: Node) -> Node {
        guard tail !== node else {
            append(value)
            return tail!
        }
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
    /**
     Removes the first node in the linked list

     Time Complexity:
     O(1) Removes the first node and assigns the head to the next
     node in constant time
    */

    @discardableResult public mutating func pop() -> Int? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    /**
     Removes the last node in the linked list
     
     Time Complexity:
     O(1) Constant time for removing the tail of the linked list
    */
    @discardableResult public mutating func removeLast() -> Int? {
        guard let head = head else {
            return nil
        }
        guard head.next != nil else {
            return pop()
        }
        var prev = head
        var current = head
        while let next = current.next {
            prev = current
            current = next
        }
        prev.next = nil
        tail = prev
        return current.value
    }
    
    /**
     Removes a value at a specific index
     
     Time Complexity:
     O(n) where n is the number of nodes to traverse until the desired index is found.
    */
    @discardableResult public mutating func remove(after node: Node) -> Int? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
    
    /**
     Begins the process of reversing a singly
     linked list given the starting head node
     
     Interview Challenge #1
     Given a linked list as your input, write a function that prints the nodes in reverse order. You should not use recursion to solve this problem.
     
    - Parameters:
        - head: The starting node we will begin our reversal at
     
     Time Complexity:
     O(n) where n is the number of reassignments needed to complete the reversal
    */
    func reverseList(head: Node?) -> Node? {
        /// Starting point of linked list
        var currentNode = head
        
        /// Reference to previous node
        var prev: Node?
        
        /// Reference to next node
        var next: Node?
        
        // Iteration through the linked list
        while currentNode != nil {
            next = currentNode?.next // Sets the next pointer to the next inital node
            currentNode?.next = prev // Sets the current.next pointer to the reversal side
            prev = currentNode // Move to prev pointer to currentNode
            currentNode = next // Traverses the current node through the Linked List
        }
        return prev
    }
    
    /**
     Finds and returns the middle most node of the linked list
     
     Interview Challenge #2
     Given a linked list, write a function that returns the middle node.
     
    - Parameters:
        - head: The starting node we will begin our reversal at
     
     Time Complexity: O(n/2) -> O(n) Where n is the number of nodes we pass through
    */

    func findMiddleNode(head: Node?) -> Node? {
        var slowPointer: Node? = head
        var fastPointer: Node? = head
        
        while fastPointer?.next != nil {
            slowPointer = slowPointer?.next
            fastPointer = fastPointer?.next?.next
        }
        
        return slowPointer
    }
    
    /**
     Interview Challenge #3
     Write a function that takes 2 sorted
     linked lists and merges them into one.
     
    - Parameters:
        - l1: Head of the first LL
        - l2: Head of the second LL
     
     Given two sorted linked list, I need to return one sorted
     Linked List
     
     Time Complexity: O(n+m) -> O(n) where n is one list and m is the other list we traverse through
    */
    
        func mergeTwoLists(_ l1: Node?, _ l2: Node?) -> Node? {
            var head: Node? = nil // Points to empty node
            var tail: Node? = nil // Points to empty node
            var currentL1 = l1 // Ref to l1 curr_node
            var currentL2 = l2 // Ref to l2 curr_node
            
            // Continue to iterate as long as one of the two LL has values
            while currentL1 != nil || currentL2 != nil {
                // If the current L1 value is less than current L2 value
                if currentL1?.value ?? Int.max < currentL2?.value ?? Int.max {
                    // inital start off for head
                    if head == nil {
                        head = currentL1
                        tail = head
                    // Set the tail pointer to currL1 next
                    } else {
                        tail?.next = currentL1
                        tail = tail?.next
                    }
                    // Move currL1 over by one in LL
                    currentL1 = currentL1?.next
                // Case where currentL2.value is < currentL1.value
                } else {
                    // inital start off for head
                    if head == nil {
                        head = currentL2
                        tail = head
                    // Set the tail pointer to currL2 next
                    } else {
                        tail?.next = currentL2
                        tail = tail?.next
                    }
                    // Move currL2 over by one in LL
                    currentL2 = currentL2?.next
                }
            }
            return head
        }
    
    func mergeTwoListsRecur(_ l1: Node?, _ l2: Node?) -> Node? {
        
        // Base Cases
        guard let l1 = l1 else { return l2 }
        guard let l2 = l2 else { return l1 }
        
        if l1.value <= l2.value {
            l1.next = mergeTwoLists(l1.next, l2)
            return l1
        } else {
            l2.next = mergeTwoLists(l1, l2.next)
            return l2
        }
    }
    
    /**
     Interview Challenge #4
     
     Write a function that removes all occurrences of a given element in a linked list.
     1 -> 6 -> 8 -> 8 -> 4
     // after removing all occurrences of 8
     1 -> 6 -> 4
     
    - Parameters:
     
     Given a linked list, assuming there are occurrences of an element, remove all of the given occurrence

     Time Complexity: O(n) where n is the number of times
     we have to pass through the LL
    */
    
    func removeOccurrence(_ l1: Node?, _ target: Int?) -> Node? {
        let dummyHead : Node? = nil
        dummyHead?.next = l1
        
        var currentNode = dummyHead
        
        while currentNode?.next != nil {
            if currentNode?.next?.value == target {
                currentNode?.next = currentNode?.next?.next
            } else {
                currentNode = currentNode?.next
            }
        }
        return dummyHead?.next
    }
}

let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)
node1.next = node2
node2.next = node3
print(node1)
var list = LinkedList<Int>()
list.push(3)
list.push(2)
list.push(1)
print("\(list)")
list.reverseList(head: node1)
list.findMiddleNode(head: node1)


extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else { return "Empty List" }
        return String(describing: head)
    }
}
