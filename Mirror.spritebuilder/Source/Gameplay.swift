//
//  Gameplay.swift
//  Mirror
//
//  Created by Olivia Ross on 7/9/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Gameplay: CCScene, CCPhysicsCollisionDelegate{
    
    weak var hero: TheHero!
    weak var gate: Gate!

    weak var contentNode: CCNode!
    weak var gamePhysicsNode: CCPhysicsNode!
    weak var cameraNode: CCNode!

    
    weak var rightButton: CCButton!
    weak var leftButton: CCButton!
    var isRightButtonHilighted = false
    var isLeftButtonHilighted = false
    
    var lifePoints : Int = 3
    weak var lifeLabel: CCLabelTTF!
    
    weak var key: CCSprite!
    var hasKey = false
    
    weak var keyLabel: CCNode!
    
    weak var pitOfDespair: CCNode!
    
 
    func didLoadFromCCB(){
        
        userInteractionEnabled = true
        gamePhysicsNode.collisionDelegate = self
        
//        visualize physics bodies & joints
//        gamePhysicsNode.debugDraw = true
        
        pitOfDespair.physicsBody.sensor = true
        key.physicsBody.sensor = true
        keyLabel.visible = false
        
        
    }
    
    override func onEnter(){
        super.onEnter()
        
        //set up camera with CCActionFollow
        let actionFollow = CCActionFollow(target: hero, worldBoundary: cameraNode.boundingBox())
        contentNode.runAction(actionFollow)
    }
    
    func jump(){
        // run jumping annimation while pushing the character up in the air with physics
        hero.animationManager.runAnimationsForSequenceNamed("Jumping")
        hero.physicsBody.applyImpulse(CGPoint(x: 0, y: 20))
    }
    

    override func update(delta: CCTime){
        //allow user to walk right as long as they are holding down the right button
        if rightButton.highlighted {
            hero.position.x += 8
            
            if isRightButtonHilighted == false {
                hero.animationManager.runAnimationsForSequenceNamed("WalkingRight")
            }
            
        } else {
            if isRightButtonHilighted == true{
                hero.animationManager.runAnimationsForSequenceNamed("Idling")
            }
        }
        //allow user to walk left as long as they are holding down the left button
        if leftButton.highlighted {
            hero.position.x -= 8
            
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
        //make it look as if the player is walking on a continuos loop
        if hero.position.x > 1000 {
            
            hero.position.x -= 2500
            
        } else if hero.position.x < 200 {
            
            hero.position.x += 2550
        
        }

        return true
    }
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, hero: CCSprite!, key: CCSprite!) -> Bool {
        // allow the user to pick up the key
        key.visible = false
        hasKey = true
        
        keyLabel.visible = hasKey
        
        return true
    }
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, hero: CCSprite!, door: CCSprite!) -> Bool {
        if hasKey {
            gate.animationManager.runAnimationsForSequenceNamed("DoorOpening")
            return true
        } else {
            return false
        }
    }
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, hero: CCSprite!, pitOfDespair: CCNode!) -> Bool {
        
        hero.position.x = 30
        
        lifePoints -= 1
        lifeLabel.string = String(lifePoints)
        
        return false
    }
}