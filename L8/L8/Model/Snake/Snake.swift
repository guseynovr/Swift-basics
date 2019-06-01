//
//  Snake.swift
//  L8
//
//  Created by Ruslan Guseynov on 01/06/2019.
//  Copyright © 2019 Ruslan Guseynov. All rights reserved.
//

import UIKit
import SpriteKit

class Snake: SKShapeNode {
    var body = [SnakeBodyPart]()
    
    let moveSpeed: CGFloat = 100.0
    var angle = CGFloat()
    
    convenience init(atPoint point: CGPoint) {
        self.init()
        
        let head = SnakeHead(atPoint: point)
        body.append(head)
        addChild(head)
        
        let bodyPart = SnakeBodyPart(atPoint: point)
        body.append(bodyPart)
        self.addChild(bodyPart)
    }

    func addBodyPart() {
        let newBodyPart = SnakeBodyPart(atPoint: body[0].position)
//        body.append(newBodyPart)
        body.insert(newBodyPart, at: 1)
        addChild(newBodyPart)
    }
    
    func move() {
        guard !body.isEmpty else { return }
        
        let head = body[0]
        moveHead(head)
        
        for index in 1..<body.count {
            let previous = body[index - 1]
            let current = body[index]
            moveBodyPart(previous: previous, current: current)
        }
    }
    
    func moveHead(_ head: SnakeBodyPart) {
        let dx = moveSpeed * sin(angle)
        let dy = moveSpeed * cos(angle)
        
        let nextPosition = CGPoint(x: head.position.x + dx, y: head.position.y + dy)
        let moveAction = SKAction.move(to: nextPosition, duration: 1.0)
        head.run(moveAction)
    }
    
    func moveBodyPart(previous: SnakeBodyPart, current: SnakeBodyPart) {
        let moveAction = SKAction.move(to: CGPoint(x: previous.position.x, y: previous.position.y), duration: 0.1)
        current.run(moveAction)
    }
    
    func moveLeft() {
        angle -= CGFloat(Double.pi/2)
    }
    
    func moveRight() {
        angle += CGFloat(Double.pi/2)
    }
}
