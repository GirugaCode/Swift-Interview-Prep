import Foundation

public struct Stack<T> {
    private var storage: [T]
    
    public init() {
        self.storage = []
    }
    
    public mutating func push(_ element: T) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> T? {
        return storage.popLast()
    }
    
    public func peek() -> T? {
        return storage.last
    }
    
    public var isEmpty: Bool {
        return peek() == nil
    }
}

/**
 Interview Challenge #1 - from Data Structures and Algorithms in Swift
 
 Given a linked list as your input, write a function that prints the nodes in reverse order. You should not use recursion to solve this problem.
 
 Assumptions:
 - I will be using a stack in this implementation
 - I can use extra spaced if needed
 - The output will be the nodes data
 
 Brainstorm:
 We can iterate through the LL and push() the elements into the stack.
 
 After the iteration we will pop() every element in the stack to be printed out
 
 Psuedocode:
 
 As long as the head is not empty
    Traverse through the list
    Add each element into a Stack
 
 Pop and print each element in a stack
    
 */

/**
 Interview Challenge #2 - from Data Structures and Algorithms in Swift
 Given a string, check if there are ( and ) characters, and return true if the parentheses in the string are balanced. For example:

 // 1
 h((e))llo(world)() // balanced parentheses
 // 2
 (hello world // unbalanced parentheses
 
 Assumtions:
 - The string does not have to contain only words
 
 Brainstorm:
Go through the string and if you see a "("
add ")" to the stack
 
If the stack is empty return false

If the popped character does not equal the character return false
 
In the end return the Stack.isEmpty
 */

func isValidParenteses(_ word: String) -> Bool {
    var stack = Stack<Character>()
    
    for character in word {
        if character == "(" {
            stack.push(")")
        }
        
        else if stack.isEmpty || stack.pop() != character {
            return false
        }
    }
    
    return stack.isEmpty
}

print(isValidParenteses("(())"))
