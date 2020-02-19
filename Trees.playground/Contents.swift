import Foundation

public struct Queue<T> {

  private var leftStack: [T] = []
  private var rightStack: [T] = []

  public init() {}

  public var isEmpty: Bool {
    return leftStack.isEmpty && rightStack.isEmpty
  }

  public var peek: T? {
    return !leftStack.isEmpty ? leftStack.last : rightStack.first
  }

  public private(set) var count = 0
  @discardableResult public mutating func enqueue(_ element: T) -> Bool {
    count += 1
    rightStack.append(element)
    return true
  }

  public mutating func dequeue() -> T? {
    if leftStack.isEmpty {
      leftStack = rightStack.reversed()
      rightStack.removeAll()
    }

    let value = leftStack.popLast()
    if value != nil {
      count -= 1
    }
    return value
  }
}


public class TreeNode<T> {
    public var value: T
    public var children: [TreeNode] = []
//    public var parent: TreeNode?
    
    init(_ value: T) {
        self.value = value
    }
    
    public func add(_ child: TreeNode) {
        children.append(child)
//        child.parent = self
    }
}

extension TreeNode {
    public func forEachDepthFirst(visit : (TreeNode) -> Void) {
        visit(self)
        children.forEach{
            $0.forEachDepthFirst(visit: visit)
        }
    }
}

extension TreeNode where T: Equatable {
    public func search(_ value: T) -> TreeNode? {
        var treeNode: TreeNode?
        forEachDepthFirst { node in
            if value == node.value {
                treeNode = node
            }
        }
        return treeNode
    }
    
    public func printOrderLevelNode(visit: (TreeNode) -> Void) {
        
    }
}



//let vertebrates = TreeNode(value: "Vertebrates")
//let invertebrates = TreeNode(value: "Invertebrates")
//let arthropods = TreeNode(value: "Arthropods")
//animals.add(child: vertebrates)
//animals.add(child: invertebrates)
//
//vertebrates.add(child: TreeNode(value: "Reptiles"))
//vertebrates.add(child: TreeNode(value: "Birds"))
//vertebrates.add(child: TreeNode(value: "Fish"))
//vertebrates.add(child: TreeNode(value: "Mammals"))
//vertebrates.add(child: TreeNode(value: "Amphibians"))
//
//invertebrates.add(child: TreeNode(value: "Protoza"))
//invertebrates.add(child: TreeNode(value: "Coelenterates"))
//invertebrates.add(child: TreeNode(value: "Flatworms"))
//invertebrates.add(child: TreeNode(value: "Annelid Worms"))
//invertebrates.add(child: TreeNode(value: "Molluscs"))
//invertebrates.add(child: TreeNode(value: "Arthropods"))
//invertebrates.add(child: TreeNode(value: "Echinoderms"))
//
//arthropods.add(child: TreeNode(value: "Arachnids"))
//arthropods.add(child: TreeNode(value: "Crustaceans"))
//arthropods.add(child: TreeNode(value: "Insects"))
//arthropods.add(child: TreeNode(value: "Myriapods"))

let animals = TreeNode("Animals")
let vertebrates = TreeNode("Vertebrates")
let invertebrates = TreeNode("Invertebrates")
 
let reptiles = TreeNode("Reptiles")
let birds = TreeNode("Birds")
let fish = TreeNode("Fish")
let amphibians = TreeNode("Amphibians")
 
let protzoa = TreeNode("protzoa")
let flatworms = TreeNode("flatworms")
let coelenterates = TreeNode("coelenterates")
let worms = TreeNode("worms")
let echinoderms = TreeNode("echinoderms")
let molluscs = TreeNode("molluscs")
 
let arthropods = TreeNode("arthropods")
 
let arachnids = TreeNode("arachnids")
let crustaceans = TreeNode("crustaceans")
let insects = TreeNode("insects")
let myrapods = TreeNode("myrapods")
 
animals.add(vertebrates)
animals.add(invertebrates)
 
vertebrates.add(reptiles)
vertebrates.add(birds)
vertebrates.add(fish)
vertebrates.add(amphibians)
 
invertebrates.add(protzoa)
invertebrates.add(flatworms)
invertebrates.add(coelenterates)
invertebrates.add(worms)
invertebrates.add(echinoderms)
invertebrates.add(molluscs)
 
invertebrates.add(arthropods)
 
arthropods.add(arachnids)
arthropods.add(crustaceans)
arthropods.add(insects)
arthropods.add(myrapods)

animals.forEachDepthFirst{print($0.value)}

if let result = animals.search("fds") {
    print(result.value)
} else {
    print("Not found", (), "yeet")
}


