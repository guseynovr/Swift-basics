//
//  SnakeBodyPart.swift
//  L8
//
//  Created by Ruslan Guseynov on 01/06/2019.
//  Copyright © 2019 Ruslan Guseynov. All rights reserved.
//

import UIKit
import SpriteKit

class SnakeBodyPart: SKShapeNode {
    
    let size = 10.0
    
    init(atPoint point: CGPoint) {
        
        super.init()
        
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: CGFloat(size), height: CGFloat(size))).cgPath
        fillColor = UIColor.green
        strokeColor = UIColor.green
        
        self.position = point
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(size - 4), center: CGPoint(x: 5, y: 5))
        self.physicsBody?.isDynamic = true
        self.physicsBody?.categoryBitMask = CollisionCategories.Snake
        self.physicsBody?.contactTestBitMask = CollisionCategories.EdgeBody | CollisionCategories.Apple
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
