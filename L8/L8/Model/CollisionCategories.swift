//
//  CollisionCategories.swift
//  L8
//
//  Created by Ruslan Guseynov on 01/06/2019.
//  Copyright © 2019 Ruslan Guseynov. All rights reserved.
//

struct CollisionCategories {
    static let Snake: UInt32 = 0x1 << 0
    static let SnakeHead: UInt32 = 0x1 << 1
    static let Apple: UInt32 = 0x1 << 2
    static let EdgeBody: UInt32 = 0x1 << 3
}
