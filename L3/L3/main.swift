//
//  main.swift
//  L3
//
//  Created by Ruslan Guseynov on 14/05/2019.
//  Copyright © 2019 Ruslan Guseynov. All rights reserved.
//

import Foundation

enum EngineState {
    case started
    case off
}

enum WindowsState {
    case opened
    case closed
}

enum Actions {
    case openWindows
    case closeWindows
    case startEngine
    case turnOffEngine
    case load(size: Int)
    case unload(size: Int)
    case printState
}

struct Car {
    let brand: String
    let dateOfProduction: Int
    let trunkSpace: Int
    var trunkSpaceUsed: Int
    var engine: EngineState
    var windows: WindowsState
    
    init(brand: String, dateOfProduction: Int, trunkSpace: Int, trunkSpaceUsed: Int = 0, engine: EngineState = .off, windows: WindowsState = .closed) {
        self.brand = brand
        self.dateOfProduction = dateOfProduction
        self.trunkSpace = trunkSpace
        self.trunkSpaceUsed = trunkSpaceUsed
        self.engine = engine
        self.windows = windows
    }
    
    mutating func perform(action: Actions) {
        print("Car \(self.brand): ", terminator: "")
        
        switch action {
            
        case .openWindows:
            windows = .opened
            print("Windows're opened")
        case .closeWindows:
            windows = .closed
            print("Windows're closed")
        case .startEngine:
            engine = .started
            print("Engine's started")
        case .turnOffEngine:
            engine = .off
            print("Engine's off")
        case .load(let size):
            if size > trunkSpace - trunkSpaceUsed {
                print("Not enough space. There is \(trunkSpace - trunkSpaceUsed)l free.")
                break
            } else if size == trunkSpace - trunkSpaceUsed {
                trunkSpaceUsed += size
                print("Loaded cargo. Trunk is now full.")
            } else {
                trunkSpaceUsed += size
                print("Cargo of is loaded. There is \(trunkSpace - trunkSpaceUsed)l of space left.")
            }
        case .unload(let size):
            if size > trunkSpaceUsed {
                print("No such cargo in \(brand)")
                break
            } else if size == trunkSpaceUsed {
                print("Trunk of \(brand) is now empty")
            }
            trunkSpaceUsed -= size
            print("Cargo of \(brand) unloaded. There is \(trunkSpace - trunkSpaceUsed)l of space left.")
        case .printState:
            print("Brand: \(brand), year of production: \(dateOfProduction), trunk space: \(trunkSpace), trunkSpaceUsed: \(trunkSpaceUsed), engine state: \(engine), windows state: \(windows)\n ")
        }
    }
}


//Не стал дублировать, а то получается одно и то же.
/*
 struct Truck {
 let brand: String
 let dateOfProduction: Int
 let cargoCapacity: Int
 var engine: EngineState
 var windows: WindowsState
 var cargo: TrunkState
 }
 */

var golf = Car(brand: "VW", dateOfProduction: 2013, trunkSpace: 300)
golf.perform(action: .load(size: 300))
golf.perform(action: .load(size: 1))
golf.perform(action: .unload(size: 301))
golf.perform(action: .unload(size: 200))
golf.perform(action: .closeWindows)
golf.perform(action: .startEngine)
golf.perform(action: .printState)

var volvo = Car(brand: "Volvo", dateOfProduction: 2017, trunkSpace: 400)
volvo.perform(action: .load(size: 400))
volvo.perform(action: .load(size: 200))
volvo.perform(action: .unload(size: 150))
volvo.perform(action: .unload(size: 300))
volvo.perform(action: .closeWindows)
volvo.perform(action: .startEngine)
volvo.perform(action: .printState)

