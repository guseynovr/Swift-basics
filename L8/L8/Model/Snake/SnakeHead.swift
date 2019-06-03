//
//  SnakeHead.swift
//  L8
//
//  Created by Ruslan Guseynov on 01/06/2019.
//  Copyright © 2019 Ruslan Guseynov. All rights reserved.
//

import UIKit
import SpriteKit

class SnakeHead: SnakeBodyPart {
    override init(atPoint point: CGPoint) {
        super.init(atPoint: point)
        
        self.physicsBody?.categoryBitMask = CollisionCategories.SnakeHead
        self.physicsBody?.collisionBitMask = CollisionCategories.EdgeBody | CollisionCategories.Apple | CollisionCategories.Snake
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
