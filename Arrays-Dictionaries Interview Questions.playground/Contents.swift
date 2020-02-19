import Foundation

/**
 Interview Question #1
 
 Given the following code:

 var array1 = [1, 2, 3, 4, 5]
 var array2 = array1
 array2.append(6)
 var len = array1.count
 
 What’s the value of the len variable, and why?
 
 The value of the len variable is 5 because array1 holds itself maintains the value it was given. array2 is a COPY of array1 and contains the element 6 in there
 */

/**
 Interview Question #2
 Implement Binary Search. Provide the time complexity as well.

 Stretch challenge: provide the space complexity
 O(logn) Logramithically gets faster because we are continually cutting the array in half.
 */
func binarySearch(_ array: [Int], _ target: Int) -> Int? {
    var left = 0
    var right = array.count - 1
    
    while (left <= right) {
        let middleIndex = (left + right) / 2
        let middleValue = array[middleIndex]
        
        if (target == middleValue) {
            return middleIndex
        }
        
        if (target > middleValue) {
            left = middleIndex + 1
        }
        
        if (target < middleValue) {
            right = middleIndex - 1
        }
    }
    return nil
}

let array = [1,2,3,4,5,7,8,9]
print(binarySearch(array, 8) as Any)

/**
 Interview Question #3
 Write a function that takes an array as input, and finds the most common element in the input array, as well as the number of times it appears. Provide the time complexity as well.

 Implementation:

 If all values are unique, it should return -1.
 
 If multiple elements appear the highest number of times, the function should return all of the elements that have the max frequency
 
 example:["red, "blue", "green", "red", "yellow", "blue"] should return: ["red", 2, "blue", 2]
 
 Stretch challenge: provide the space complexity
 O(2n) -> O(n)
 */

func commonElement(array: [String]) -> Bool {
    var dict = [String:Int]()
    
    for color in array {
        if let count = dict[color] {
            dict[color] = count + 1
        } else {
            dict[color] = 1
        }
    }
    
    
    for key in dict {
        if key.value <= 1 {
            dict.removeValue(forKey: key.key)
        }
    }
    return false
}

print(commonElement(array: ["red", "blue", "green", "red", "yellow", "blue"]))

/**
 Interview Question #4
 Write a funcion that takes in an unsorted integer array containing “n” numbers ranging from 0 to n-2, where there is exactly one number repeated in the array. The function should find and return the duplicate number. Provide the time complexity as well.

 Example:

 Given an input array where n = 5 looked like the following: [0, 3, 1, 2, 3], then the function should return 3, as it is the duplicate.
 
 Stretch challenge: provide the space complexity
 O(nlogn) - Because we are sorting the array
 */

func findDuplicate(array: [Int]) -> Int {
    
    // Sort the array
    let sortedArray = array.sorted()
    
    // Iterate throught the sorted array
    for i in 0..<sortedArray.count {
        // check if the item is equal to the item ahead of it
        if sortedArray[i] == sortedArray[i+1] {
            // if so return that item
            return sortedArray[i]
        }
    }
    return 0
}

let array1 = [0, 3, 1, 2, 3]
print(findDuplicate(array: array1))

/**
 Interview Question #5
 
 Given an array of integers, return indices of the two numbers such that they add up to a specific target. Provide the time complexity as well.

 Assume that each input would have exactly one solution, and you may not use the same element twice. Your solution must use dictionaries.

 Example: Given an input array [2, 7, 11, 15], and a target of 9, Because 2 + 7 = 9, the function would return [0, 1]
 Extra Stretch challenge: provide the space complexity
 O(n) where n is the number of items we traverse
 */

func twoSum(array: [Int], target: Int) -> Bool {
    
    var left = 0
    var right = array.count - 1
    
    while left < right {
        let sum = array[left] + array[right]
        
        if sum == target {
            print("The indexes to make the sum of target are \(left) and \(right)")
            return true
        } else if sum < target {
            left += 1
        } else if sum > target {
            right -= 1
        }
    }
    
    return false
    
}

let array2 = [2, 7, 11, 15]
print(twoSum(array: array2, target: 9))




/**
Given a string (s) return the first occurrance of a non-repeating charater in it.
If there are no charaters in the string, then return '_'

Input: s = "abacabad"
Output: 'c'

Psuedocode:

Create dictionary where the keys:character and values: # of occurrences

Iterate through the string and set the keys and values in the dictionary

Return the first occurance that has the value of 1 in the dictionary, if not then return '_'

*/

func firstNotRepeatingCharacter(s: String) -> Character {
    var char_dict: [Character: Int] = [:]
    
    for char in s {
        if char_dict[char] != nil {
            var occurrance = char_dict[char]!
            occurrance += 1
            char_dict[char] = occurrance
        } else {
            char_dict[char] = 1
        }
    }
    
    return s.first{ char_dict[$0] == 1 } ?? "_"
}



/**
Given a 2-D array of numbers, check if each column, row and each of the 3 x 3 sub grids compose of the numbers 1-9
return true if it is a valid sudoku grid and false if not.

Input:
[[1,3,2,5,4,6,9,8,7],
 [4,6,5,8,7,9,3,2,1],
 [7,9,8,2,1,3,6,5,4],
 [9,2,1,4,3,5,8,7,6],
 [3,5,4,7,6,8,2,1,9],
 [6,8,7,1,9,2,5,4,3],
 [5,7,6,9,8,1,4,3,2],
 [2,4,3,6,5,7,1,9,8],
 [8,1,9,3,2,4,7,6,5]]

Output:True

Input:
[[1,3,2,5,4,6,9,8,7],
 [4,6,5,8,7,9,3,2,1],
 [7,9,8,2,1,3,6,5,4],
 [9,2,1,4,3,5,8,7,6],
 [3,5,4,7,6,8,2,1,9],
 [6,8,7,1,9,2,5,4,3],
 [5,4,6,9,8,1,4,3,2],
 [2,7,3,6,5,7,1,9,8],
 [8,1,9,3,2,4,7,6,5]]

Output:False

Create variables to hold validation for rows, columns and blocksets.
Use a set to determine if they are numbers from 1-9

Iterate through each enumerated row in the board
    Iterate through each enumberated column in the board
    check if each row
    column
    blocksets are already in the sets
    if so return false

If made through the iteration then return true

*/

func sudokuCheck(grid: [[Int]]) -> Bool {

}
