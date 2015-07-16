//
//  Gameplay.swift
//  Mirror
//
//  Created by Olivia Ross on 7/9/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Gameplay: CCScene, CCPhysicsCollisionDelegate{
    
    weak var hero: Hero!

    weak var contentNode: CCNode!
    weak var gamePhysicsNode: CCPhysicsNode!
    weak var levelOneNode: CCNode!



    weak var rightButton: CCButton!
    weak var leftButton: CCButton!
    var isRightButtonHilighted = false
    var isLeftButtonHilighted = false
    
 
    func didLoadFromCCB(){
        userInteractionEnabled = true
        gamePhysicsNode.collisionDelegate = self
        
    }
    
    override func onEnter(){
        super.onEnter()
        
        //set up camera with CCActionFollow
        let actionFollow = CCActionFollow(target: hero, worldBoundary: levelOneNode.boundingBox())
        contentNode.runAction(actionFollow)

    }
    
    func jump(){
        // run jumping annimation while pushing the character up in the air with physics
        hero.animationManager.runAnimationsForSequenceNamed("Jumping")
        hero.physicsBody.applyImpulse(CGPoint(x: 0, y: 200))
    }
    

    override func update(delta: CCTime){
        //allow user to walk right as long as they are holding down the right button
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
        //allow user to walk left as long as they are holding down the left button
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
        //make it look as if the player is walking on a continuos loop
        if hero.position.x > 1000 {
            
            hero.position.x -= 1100
            
        } else if hero.position.x < 200 {
            
            hero.position.x += 1100
        
        }

        return true
    }
    
}