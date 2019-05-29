//
//  main.swift
//  L7
//
//  Created by Ruslan Guseynov on 25/05/2019.
//  Copyright © 2019 Ruslan Guseynov. All rights reserved.
//

import Foundation

enum CalculatorError: String, Error {
    case dividedByZero = "Can't divide by zero"
    case expressionFormatError = "Expression format error (a sign b)"
    case numberFormatError = "'a' and 'b' have to represent numbers"
}

enum Operation {
    case add
    case substract
    case multiply
    case divide
}

class VerySimpleCalculator {
    var firstValue: Double!
    var secondValue: Double!
    var operation: Operation!
    
    init() {
        print("Type an arithmetic expression\n")
        print("Format: \"a operation b\", where \"a\" and \"b\" are numbers and operation is one of [+, -, *, /]. \n\nOr type stop/exit/quit to quit\n")
        var expression: String = readLine() ?? ""
        
        while !isFinished(expression) {
            do {
                try process(expression)
            } catch let error as CalculatorError {
                print("\(error.rawValue)\n")
                expression = readLine() ?? ""
                continue
            } catch {
                print("Unexpected error: \(error)\n")
            }
            
            
            switch operation! { //process() guarantees that 'operation' != nil
            case .add:
                expression += " = \(firstValue + secondValue)"
            case .substract:
                expression += " = \(firstValue - secondValue)"
            case .multiply:
                expression += " = \(firstValue * secondValue)"
            case .divide:
                expression += " = \(firstValue / secondValue)"
            }
            
            print("\(expression)\n")
            
            expression = readLine() ?? ""
        }
    }
    
    func process(_ line: String)  throws {
        let parameters = line.split(separator: " ")
        
        guard parameters.count == 3 else {
            throw CalculatorError.expressionFormatError
        }
        
        guard let first = Double(String(parameters[0])),
            let second = Double(String(parameters[2])) else{
                
            throw CalculatorError.numberFormatError
        }
        
        firstValue = first
        secondValue = second
        
        switch String(parameters[1]) {
        case "+":
            operation = .add
        case "-":
            operation = .substract
        case "*":
            operation = .multiply
        case "/":
            operation = .divide
        default:
            throw CalculatorError.expressionFormatError
        }
        
//        if let first = Double(String(parameters[0])) {
//            firstValue = first
//        } else {
//            throw CalculatorError.numberFormatError
//        }
//
//        if let second = Double(String(parameters[2])) {
//            secondValue = second
//        } else {
//            throw CalculatorError.numberFormatError
//        }
        
        if operation == .divide && secondValue == 0 {
            throw CalculatorError.dividedByZero
        }
    }
    
    func isFinished(_ line: String) -> Bool {
        let lowerCased = line.lowercased()
        return lowerCased == "stop" || lowerCased == "exit" || lowerCased == "quit"
    }
}


var calc = VerySimpleCalculator()






