import Foundation


//IteratorProtocol
//Sequence

struct StackIterator<T>: IteratorProtocol {
    //typealias Element = T
    
    var stack: Stack<T>
    
    mutating func next() -> T? {
        return stack.pop()
    }
}

struct Stack<Element>: Sequence {
    var items = [Element]()
    
    mutating func push(_ newItem: Element){
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        guard items.isEmpty else {
            return nil
        }
        return items.removeLast()
    }
    
    func map<U>(_ transformer: (Element) -> U) -> Stack<U> {
        var mappedItems = [U]()
        
        for item in items {
            let transformedItem = transformer(item)
            mappedItems.append(transformedItem)
        }
        
        return Stack<U>(items: mappedItems)
    }
    
    func makeIterator() -> StackIterator<Element> {
        return StackIterator(stack: self)
    }
}

//protocol IteratorProtocol {
//    associatedtype Element
//    
//    mutating func next() -> Element?
//}

protocol Sequence {
    associatedtype Iterator: IteratorProtocol
    associatedtype Element where Element == Iterator.Element
    
    func makeIterator() -> Iterator
}



var myStack = Stack<Int>()
myStack.push(10)
myStack.push(20)
myStack.push(30)

var myStackIterator = StackIterator(stack: myStack)

//while let value = myStackIterator.next() {
//    print("\(value)")
//}

for value in myStack {
    print("\(value)")
}




