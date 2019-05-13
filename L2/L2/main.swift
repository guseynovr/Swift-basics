//
//  main.swift
//  L2
//
//  Created by Ruslan Guseynov on 08/05/2019.
//  Copyright © 2019 Ruslan Guseynov. All rights reserved.
//

import Foundation


func first4tasks() {
    func isEven(_ a: Int) -> Bool {
        return a % 2 == 0
    }
    
    func isMultipleOfThree(_ a: Int) -> Bool {
        return a % 3 == 0
    }
    
    var array = Array<Int>()
    
    for i in 1...100 {
        array.append(i)
    }
    
    for i in array where (isEven(i) || isMultipleOfThree(i)) {
        if let index = array.firstIndex(of: i) {
            array.remove(at: index)
        }
    }
    
    print("Array 1...100 without multiples of two and three:\n\(array)\n")
}

func appendFibonacci(amount: Int, to array: inout Array<Double>) {
    
    var amount = amount
    
    if array.count < 2 {
        array.insert(1, at: 0)
        array.insert(1, at: 1)
        amount -= 2
    }
    
    for i in array.count - 1..<array.count + amount - 1 {
        array.append(array[i] + array[i-1])
    }
}

func findPrimes(amount: Int) -> Array<Int> {
    
    var array = Array<Int>()
    var primeCount = 0
    
    var start: Int = -1
    var end: Int = -1
    
    func appendNextHundred() {
        
        start = array.count == 0 ? 1 : array.count + 1
        end = start + 99
        
        for i in start...end {
            array.append(i)
        }
        
        array[0] = 0 //1 is not a prime number
    }
    
    func setComplexNumbersToZero() {
        for i in array {
            if i == 0 { continue }
            
            if let index = array.firstIndex(of: i) {
                
                for p in stride(from: index + i, to: array.count, by: i) {
                    array[p] = 0
                }
            }
        }
    }
    
    
    while (primeCount < amount) {
        
        primeCount = 0
        
        appendNextHundred()
        
        setComplexNumbersToZero()
        
        for i in array where i != 0 {
            primeCount += 1
        }
    }
    
    while let indexOfZeroValue = array.firstIndex(of: 0) {
        array.remove(at: indexOfZeroValue)
    }
    
    
    
    //    print("Found \(primeCount) primes\n")
    
    return Array<Int>(array.prefix(upTo: 100))
}


// MARK: tests

first4tasks()

var array = [1.0, 1.0]
appendFibonacci(amount: 100, to: &array)
print("Fibonacci\n\(array)\n")

print("Prime numbers\n\(findPrimes(amount: 100))\n")
