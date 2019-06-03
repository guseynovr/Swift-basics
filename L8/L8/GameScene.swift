//
//  GameScene.swift
//  L8
//
//  Created by Ruslan Guseynov on 01/06/2019.
//  Copyright © 2019 Ruslan Guseynov. All rights reserved.
//

import SpriteKit
import GameplayKit



class GameScene: SKScene {
    
    var snake: Snake?
    var apple: Apple?
    
    override func didMove(to view: SKView) {
        
        backgroundColor = SKColor.black
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.physicsBody?.allowsRotation = false
//        view.showsPhysics = true
        
        let leftButton = SKShapeNode()
        leftButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        leftButton.position = CGPoint(x: view.scene!.frame.minX + 30, y: view.scene!.frame.minY + 30)
        leftButton.fillColor = UIColor.gray
        leftButton.strokeColor = UIColor.gray
        leftButton.name = "leftButton"
       
        
        let rightButton = SKShapeNode()
        rightButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        rightButton.position = CGPoint(x: view.scene!.frame.maxX - 75, y: view.scene!.frame.minY + 30)
        rightButton.fillColor = UIColor.gray
        rightButton.strokeColor = UIColor.gray
        rightButton.name = "rightButton"
        
        addChild(leftButton)
        addChild(rightButton)
        
        createApple()
        
        snake = Snake(atPoint: CGPoint(x: view.scene!.frame.midX, y: view.scene!.frame.midY))
        addChild(snake!)
        
        self.physicsWorld.contactDelegate = self
        self.physicsBody?.categoryBitMask = CollisionCategories.EdgeBody
        self.physicsBody?.collisionBitMask = CollisionCategories.Snake | CollisionCategories.SnakeHead
    }
    
    func createApple() {
        let randomX = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxX - 5)))
        let randomY = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxY - 105)) + 100)
        
        let apple = Apple(position: CGPoint(x: randomX, y: randomY))
        self.apple = apple
        
        addChild(apple)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
            let touchLocation = touch.location(in: self)
            guard let touchedNode = self.atPoint(touchLocation) as? SKShapeNode,
                    touchedNode.name == "leftButton" || touchedNode.name == "rightButton" else {
                return
            }
            
            touchedNode.fillColor = UIColor.orange
            touchedNode.strokeColor = UIColor.orange
            
            if touchedNode.name == "leftButton" {
                snake!.moveLeft()
            } else if touchedNode.name == "rightButton" {
                snake!.moveRight()
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
            let touchLocation = touch.location(in: self)
            guard let touchedNode = self.atPoint(touchLocation) as? SKShapeNode,
                touchedNode.name == "leftButton" || touchedNode.name == "rightButton" else {
                    return
            }
            
            touchedNode.fillColor = UIColor.gray
            touchedNode.strokeColor = UIColor.gray
            
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        snake?.move()
    }
}

extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        let bodies = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        let collisionObject = bodies ^ CollisionCategories.SnakeHead
        
        switch collisionObject {
        case CollisionCategories.Apple:
            let apple = contact.bodyA.node is Apple ? contact.bodyA.node : contact.bodyB.node
            snake?.addBodyPart()
            apple?.removeFromParent()
            createApple()
        case CollisionCategories.EdgeBody, CollisionCategories.Snake:
            snake?.removeFromParent()
            apple?.removeFromParent()
            
            snake = Snake(atPoint: CGPoint(x: view!.scene!.frame.midX, y: view!.scene!.frame.midY))
            addChild(snake!)
            createApple()    
        default:
            break
        }
    }
}

