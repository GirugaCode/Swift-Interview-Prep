

func bubbleSort<T>(_ array: inout [T]) where T: Comparable {
  guard array.count >= 2 else {
    return
  }
  for end in (1..<array.count).reversed() {
    var swapped = false
    for current in 0..<end {
      if array[current] > array[current + 1] {
        array.swapAt(current, current + 1)
        swapped = true
      }
    }
    if !swapped {
      return
    }
  }
}


func selectionSort<T>(_ array: inout[T]) where T: Comparable {
    // Checks if we have atleast 2 elements in the array
    guard array.count >= 2 else { return }
    
    for index in 0..<array.count - 1 {
        var minimumNum = index
        for subIndex in index..<array.count {
            if array[subIndex] < array[minimumNum] {
                minimumNum = subIndex
            }
        }
        array.swapAt(index, minimumNum)
    }

    return
}


func insertionSort<T>(_ array: inout[T]) where T: Comparable {
    guard array.count >= 2 else { return }
    // Iterate through the list
        // Assume the first element is sorted
        // Assign the next element
        // While the previous elements is greater than or equal to 0 and current is < the next element
            // set the next element after sub to the next element
            // decrement element
        // assign the next element + one to the currents sorted element
    // return array
    
    for index in 0..<array.count {
        let currentUnsortedItem = array[index]
        var subItem = index - 1
        
        while subItem >= 0 && currentUnsortedItem < array[subItem] {
            array[subItem + 1] = array[subItem]
            subItem -= 1
        }
        array[subItem + 1] = currentUnsortedItem
    }
    return
}


var array = [1,4,3,10,1]

print(insertionSort(&array))

print(array)
