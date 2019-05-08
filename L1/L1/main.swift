//
//  main.swift
//  L1
//
//  Created by Ruslan Guseynov on 02/05/2019.
//  Copyright © 2019 Ruslan Guseynov. All rights reserved.
//

import Foundation

func task1(a: Double, b: Double, c: Double) {
    
    print("Task1")
    
    let d: Double = b * b - 4 * a * c
    
    let numOfRoots: Int
    
    if d < 0 {
        numOfRoots = 0
    } else if d == 0 {
        numOfRoots = 1
    } else {
        numOfRoots = 2
    }
    
    switch numOfRoots {
    case 0:
        print("There is no root for this quadratic equation")
    case 1:
        print("x1 = " +
            String(
                (-b + Double(d).squareRoot()) / (2 * a)
            )
        )
    case 2:
        print("x1 = " +
            String(
                (-b + Double(d).squareRoot()) / (2 * a)
            )
        )
        print("x1 = " +
            String(
                (-b - Double(d).squareRoot()) / (2 * a)
            )
        )
    default:
        print("numOfRoots is miscalculated")
    }
    
    print()
}

func task2(legA: Double, legB: Double) {
    
    print("Task2")
    
    let hypotenuse = Double(legA * legA + legB * legB).squareRoot()
    
    print("hypotenuse = " + String(hypotenuse))
    print("Perimeter = " + String(legA + legB + hypotenuse))
    print("Area = " + String(legA * legB / 2))
    
    print()
}

func task3() {
    
    print("Task3")
    
    print("Чтобы рассчитать сумма вклада через 5 лет, введите сумму вклада - положительное число")
    
    var sum: Double = -1.0
    while (sum == -1.0) {
        sum = Double(readLine() ?? "") ?? -1.0
        if (sum == -1.0) {
            print("Неверный формат входных данных")
        }
    }
    
    print("\nВведите годовой процент - положительное число")
    
    var percentage: Double = -1.0
    while (percentage == -1.0) {
        percentage = Double(readLine() ?? "") ?? -1.0
        if (percentage == -1.0) {
            print("Неверный формат входных данных")
        }
    }
    
    for _ in (1...5) {
        sum += sum * percentage / 100
    }
    
    print("\nЧерез 5 лет сумма вклада будет равняться " + String(sum) + "\n")
}


// MARK: Tests

task1(a: 1.0, b: -8.0, c: 12.0)
task2(legA: 3.0, legB: 4.0)
task3()
