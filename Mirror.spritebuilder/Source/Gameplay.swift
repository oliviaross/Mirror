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
    weak var rightButton: CCButton!
    weak var leftButton: CCButton!
    var rightButtonPreviousState = false
    var leftButtonPreviousState = false
    
    func didLoadFromCCB(){
        userInteractionEnabled = true
        gamePhysicsNode.collisionDelegate = self
    }
    
    func moveLeft() {
        hero.position.x -= 0.5
        hero.animationManager.runAnimationsForSequenceNamed("WalkingLeft")
    }
    
    func moveRight() {
        hero.position.x += 0.5
        hero.animationManager.runAnimationsForSequenceNamed("WalkingRight")
    }
    
    func jump() {
            hero.animationManager.runAnimationsForSequenceNamed("Jumping")
            hero.physicsBody.applyImpulse(CGPoint(x: 0, y: 100))
    }
    
    override func update(delta: CCTime) {
        if rightButton.highlighted {
            hero.position.x += 3
            
            if rightButtonPreviousState == false {
                hero.animationManager.runAnimationsForSequenceNamed("WalkingRight")
            }
            
        } else {
            if rightButtonPreviousState == true{
                hero.animationManager.runAnimationsForSequenceNamed("Idling")
            }
        }
        
        if leftButton.highlighted {
            hero.position.x -= 3
            
            if leftButtonPreviousState == false {
                hero.animationManager.runAnimationsForSequenceNamed("WalkingLeft")
            }
            
        } else {
            if leftButtonPreviousState == true{
                hero.animationManager.runAnimationsForSequenceNamed("Idling")
            }
        }
        
        rightButtonPreviousState = rightButton.highlighted
        leftButtonPreviousState = leftButton.highlighted
    }
}