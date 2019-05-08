//
//  main.swift
//  L2
//
//  Created by Ruslan Guseynov on 08/05/2019.
//  Copyright © 2019 Ruslan Guseynov. All rights reserved.
//

import Foundation

var array = Array<Int>()

for i in 0...541 {
    array.append(i)
}

array[1] = 0

for i in array {
    
    if i == 0 {
        continue
    }
    
    if let index = array.firstIndex(of: i) {
        
        for p in stride(from: index + i, to: array.count, by: i) {
            
            array[p] = 0
        }
    }
}

var result = Array<Int>()

for i in array {
    if i != 0 {
        result.append(i)
    }
}

print("result.count = " + String(result.count) + "\n")
print(result)


