//
//  main.swift
//  L4
//
//  Created by Ruslan Guseynov on 18/05/2019.
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

enum Gender {
    case Male
    case Female
}

class Car {
    var brand: String
    var requiredLicense: DriverLicense
    weak var driver: Driver?
    
    init(brand: String, requiredLicense: DriverLicense) {
        self.brand = brand
        self.requiredLicense = requiredLicense
    }
    
    func drive(distance: Int) {
        print("Car is driving")
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
    
    var bodyType: BodyType = BodyType.FlatBed
    var cargoCapacity: Int
    
    init(brand: String, bodyType: BodyType, cargoCapacity: Int) {
        self.bodyType = bodyType
        self.cargoCapacity = cargoCapacity
        super.init(brand: brand, requiredLicense: DriverLicense.C)
    }
    
    override func drive(distance: Int) {
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

class SportsCar: Car {
    var topSpeed: Int
    var acceleration: Double
    
    init(brand: String, topSpeed: Int, acceleration: Double) {
        self.topSpeed = topSpeed
        self.acceleration = acceleration
        super.init(brand: brand, requiredLicense: DriverLicense.B)
    }
    
    override func drive(distance: Int) {
        print("SportsCar will travel \(distance)km in \(distance/topSpeed)h at top speed.")
    }
}


class Person {
    var name: String
    var familyName: String
    let dateOfBirth: Int
    var gender: Gender //var :)
    
    init(name: String, familyName: String, dateOfBirth: Int, gender: Gender) {
        self.name = name
        self.familyName = familyName
        self.dateOfBirth = dateOfBirth
        self.gender = gender
    }
}

class Driver: Person {
    var driversLicense: DriverLicense
    var car: Car?
    
    init(name: String, familyName: String, dateOfBirth: Int, gender: Gender, license: DriverLicense) {
        self.driversLicense = license
        super.init(name: name, familyName: familyName, dateOfBirth: dateOfBirth, gender: gender)
    }
    
    convenience init(license: DriverLicense, person: Person) {
        self.init(name: person.name, familyName: person.familyName, dateOfBirth: person.dateOfBirth, gender: person.gender, license: license)
    }
}

var volvoTruck = Truck(brand: "Volvo", bodyType: .FlatBed, cargoCapacity: 30_000)
var supra = SportsCar(brand: "Toyota", topSpeed: 300, acceleration: 3.4)

volvoTruck.drive(distance: 300)
volvoTruck.loadCargo(volume: 10_000)

supra.drive(distance: 300)

print()

print("Truck body type: \(volvoTruck.bodyType), truck cargo capacity: \(volvoTruck.cargoCapacity), required license category for this car: \(volvoTruck.requiredLicense)")
print("Supra top speed is \(supra.topSpeed)km/h and acceleration is \(supra.acceleration)s, required license category for this car is \(supra.requiredLicense)")
