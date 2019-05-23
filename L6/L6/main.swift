//
//  main.swift
//  L6
//
//  Created by Ruslan Guseynov on 23/05/2019.
//  Copyright © 2019 Ruslan Guseynov. All rights reserved.
//

import Foundation

struct Queue<T> {
    
    private var elements: [T] = []
    
    mutating func enqueue(_ element: T) {
        elements.append(element)
    }
    
    mutating func dequeue() -> T? {
        return elements.count > 0 ? elements.removeFirst() : nil
    }
    
    func filtered(by condition: (T) -> Bool) -> Queue<T> {
        var filteredElements: Queue<T> = Queue<T>()
        
        for element in elements where condition(element) {
            filteredElements.enqueue(element)
        }
        
        return filteredElements
    }
    
    func peek() -> T? {
        return elements.first
    }
    
    func getSize() -> Int {
        return elements.count
    }
    
    subscript(index: Int) -> T? {
        return elements.indices.contains(index) ? elements[index] : nil
    }

    subscript(indexes: Int ...) -> Queue<T?> {
        var result: Queue<T?> = Queue<T?>()
        
        for index in indexes {
            result.enqueue(elements.indices.contains(index) ? elements[index] : nil)
        }
        
        return result
    }
}

//MARK: Tests

var q: Queue<Int> = Queue<Int>()
for i in 0...4 {
    q.enqueue(i)
}
print(q.filtered { $0 % 2 == 0 })
print(q[2], q[10])
print(q[0, 2, 3, 5])
print(q.dequeue())
print(q)


