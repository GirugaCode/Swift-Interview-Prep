class Binarytree<T> {
    
    var children: [Binarytree] = []
    var data: T
    var leftChild: Binarytree?
    var rightChild: Binarytree?
    
    
    
    init(_ data: T, _ leftChild: Binarytree?, _ rightChild: Binarytree?) {
        self.data = data
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
    
    public func add(_ child: Binarytree) {
        children.append(child)
    }
    func maxDepth(_ root: Binarytree?) -> Int{
        if root == nil{
            return 0
        }
        else{
            let lDepth = maxDepth(root?.leftChild);
            let rDepth = maxDepth(root?.rightChild);
    
            if (lDepth > rDepth){
                return(lDepth+1)
            }
            else {
                return(rDepth+1)
            }
        }
    }
    
    func traverseInOrder(visit: (T) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(data)
        rightChild?.traverseInOrder(visit: visit)
        
    }
    
    func preInOrder(visit: (T) -> Void) {
            visit(data)
           leftChild?.traverseInOrder(visit: visit)
           rightChild?.traverseInOrder(visit: visit)
           
       }
    
    func traverseePostOrder(visit: (T) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        rightChild?.traverseInOrder(visit: visit)
        visit(data)
    }
    
    
    func height<T>(of node: Binarytree<T>?) -> Int {
        if node == nil {
            return -1
            
        }
        else {
            let leftDepth = height(of: node?.leftChild)
            let rightDepth = height(of: node?.rightChild)
            
            if (leftDepth > rightDepth) {
                return leftDepth + 1
            } else {
                return rightDepth + 1
            }
        }
    }
}


class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rowSet = [Set<Character>](repeating: Set<Character>(), count: 9)
        var columnSet = [Set<Character>](repeating: Set<Character>(), count: 9)
        var squareSet = [Set<Character>](repeating: Set<Character>(), count: 9)
        
        
        for (rowIndex, row) in board.enumerated() {
            for (colIndex, character) in row.enumerated() {
                if character == Character(".") {continue}
                
                guard !rowSet[rowIndex].contains(character) else {
                    return false
                }
                rowSet[rowIndex].insert(character)
                
                guard !columnSet[colIndex].contains(character) else {
                    return false
                }
                columnSet[colIndex].insert(character)
                
                let squareIndex = (row.count/3) * 3 + (colIndex / 3)
                guard !squareSet[squareIndex].contains(character) else {
                    return false
                }
                squareSet[squareIndex].insert(character)
            }
        }
        return true
    }
}
