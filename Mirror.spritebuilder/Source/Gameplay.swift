//
//  Gameplay.swift
//  Mirror
//
//  Created by Olivia Ross on 7/9/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Gameplay: CCScene{
    
    weak var hero: Hero!
    weak var gamePhysicsNode: CCPhysicsNode!
    
    func didLoadFromCCB(){
        userInteractionEnabled = true
        gamePhysicsNode.collisionDelegate = self
    }
    
    func moveLeft() {
        hero.position.x -= 20
        hero.animationManager.runAnimationsForSequenceNamed("WalkingRight")
    }
    
    func moveRight() {
        hero.position.x += 20
        hero.animationManager.runAnimationsForSequenceNamed("WalkingLeft")
    }
    
    func jump() {
        hero.animationManager.runAnimationsForSequenceNamed("Jumping")
        hero.physicsBody.applyImpulse(CGPoint(x: 0, y: 100))
    }
    
}