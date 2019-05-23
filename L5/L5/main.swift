//
//  main.swift
//  L5
//
//  Created by Ruslan Guseynov on 22/05/2019.
//  Copyright © 2019 Ruslan Guseynov. All rights reserved.
//

import Foundation

enum DriverLicense {
    case A
    case B
    case C
    case D
    case E
}

protocol Car {
    var brand: String { get }
    var isEngineOn: Bool { get set }
    var requiredLicense: DriverLicense { get }
    
    func drive(distance: Int)
    mutating func startEngine()
    mutating func stopEngine()
}

extension Car {
    
    mutating func startEngine() {
        isEngineOn = true
        print("Engine is on")
    }
    
    mutating func stopEngine() {
        isEngineOn = false
        print("Engine is off")
    }
}

class Truck: Car {
   
    enum BodyType {
        case FlatBed
        case Van
        case Contractor
        case Dump
        case TemperatureControlled
        case Tanker //цистерна
    }
    
    var bodyType: BodyType
    var cargoCapacity: Int
    var brand: String
    var isEngineOn = false
    var requiredLicense = DriverLicense.C
    
    init(brand: String, bodyType: BodyType, cargoCapacity: Int) {
        self.brand = brand
        self.bodyType = bodyType
        self.cargoCapacity = cargoCapacity
    }
    
    func drive(distance: Int) {
        print("Truck is going slowly.")
    }
    
    func loadCargo(volume: Int){
        if volume <= cargoCapacity {
            print("Successfully loaded")
        } else {
            print("Not enought space")
        }
    }
}

extension Truck: CustomStringConvertible {
    var description: String {
        return "Truck: body type = \(self.bodyType), truck cargo capacity = \(self.cargoCapacity), required license category = \(self.requiredLicense)"
    }
}

class SportsCar: Car {
    
    var brand: String
    var isEngineOn = false
    var topSpeed: Int
    var acceleration: Double
    let requiredLicense = DriverLicense.B
    
    init(brand: String, topSpeed: Int, acceleration: Double) {
        self.brand = brand
        self.topSpeed = topSpeed
        self.acceleration = acceleration
    }
    
    func drive(distance: Int) {
        print("SportsCar will travel \(distance)km in \(distance/topSpeed)h at top speed.")
    }
}

extension SportsCar: CustomStringConvertible {
    var description: String {
        return "Sportscar: top speed = \(self.topSpeed)km/h, acceleration = \(self.acceleration)s, required license = \(self.requiredLicense)"
    }
}

var volvoTruck = Truck(brand: "Volvo", bodyType: .FlatBed, cargoCapacity: 30_000)
var supra = SportsCar(brand: "Toyota", topSpeed: 300, acceleration: 3.4)

volvoTruck.drive(distance: 300)
volvoTruck.loadCargo(volume: 10_000)
volvoTruck.startEngine()

print("\n\(volvoTruck)\n")

supra.drive(distance: 300)
supra.startEngine()
supra.stopEngine()

print("\n\(supra)\n")



