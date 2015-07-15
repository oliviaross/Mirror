//
//  Gameplay.swift
//  Mirror
//
//  Created by Olivia Ross on 7/9/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Gameplay: CCScene, CCPhysicsCollisionDelegate{
    
    enum whichSide {
        case Left
        case Right
    }
    
    weak var hero: Hero!
    weak var gamePhysicsNode: CCPhysicsNode!
    weak var landscape: CCNode!
    weak var landscapeFLIP: CCNode!
//    weak var leftWall: CCNode!
//    weak var rightWall: CCNode!
    var Side = whichSide.Left
    
    weak var rightButton: CCButton!
    weak var leftButton: CCButton!
    var isRightButtonHilighted = false
    var isLeftButtonHilighted = false
 
    func didLoadFromCCB(){
        userInteractionEnabled = true
        gamePhysicsNode.collisionDelegate = self
        
        landscape.visible = true
        landscapeFLIP.visible = false
        
    }
    
    func jump() {
        hero.animationManager.runAnimationsForSequenceNamed("Jumping")
        hero.physicsBody.applyImpulse(CGPoint(x: 0, y: 200))
    }
    

    override func update(delta: CCTime) {
        if rightButton.highlighted {
            hero.position.x += 3
            
            if isRightButtonHilighted == false {
                hero.animationManager.runAnimationsForSequenceNamed("WalkingRight")
            }
            
        } else {
            if isRightButtonHilighted == true{
                hero.animationManager.runAnimationsForSequenceNamed("Idling")
            }
        }
        
        if leftButton.highlighted {
            hero.position.x -= 3
            
            if isLeftButtonHilighted == false {
                hero.animationManager.runAnimationsForSequenceNamed("WalkingLeft")
            }
            
        } else {
            if isLeftButtonHilighted == true{
                hero.animationManager.runAnimationsForSequenceNamed("Idling")
            }
        }
        
        isRightButtonHilighted = rightButton.highlighted
        isLeftButtonHilighted = leftButton.highlighted
    }
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, hero: CCSprite!, wall: CCNode!) -> Bool {
        if Side == whichSide.Left {
            landscape.visible = false
            landscape.removeFromParent()
            
            landscapeFLIP.visible = true
            landscapeFLIP.addChild(gamePhysicsNode)
        } else {
            landscape.visible = true
            landscape.addChild(gamePhysicsNode)
            landscapeFLIP.visible = false
            landscapeFLIP.removeFromParent()
        }
        
        if landscape.visible {
            Side = whichSide.Left
        } else if landscapeFLIP.visible {
            Side = whichSide.Right
        }
        
        return true
    }
 
}