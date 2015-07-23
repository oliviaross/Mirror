//
//  Gameplay.swift
//  Mirror
//
//  Created by Olivia Ross on 7/9/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Gameplay: CCNode, CCPhysicsCollisionDelegate{
    
    weak var hero: TheHero!
    weak var gate: Gate!
    
    weak var contentNode: CCNode!
    weak var gamePhysicsNode: CCPhysicsNode!
    weak var cameraBoundingBox: CCNode!

    
    weak var rightButton: CCButton!
    weak var leftButton: CCButton!
//    weak var jumpButton: CCButton!
    var isRightButtonHilighted = false
    var isLeftButtonHilighted = false
//    var isJumpButtonHilighted = false
    
    var lifePoints : Int = 3
    weak var lifeLabel: CCLabelTTF!
    
    weak var key: CCSprite!
    var hasKey = false
    
    weak var keyLabel: CCNode!
    
    weak var pitOfDespair: CCNode!
    
 
    func didLoadFromCCB(){

      
        userInteractionEnabled = true
        multipleTouchEnabled = true
        gamePhysicsNode.collisionDelegate = self
        
//        visualize physics bodies & joints
//        gamePhysicsNode.debugDraw = true
      
        pitOfDespair.physicsBody.sensor = true
        gate.physicsBody.sensor = true
        key.physicsBody.sensor = true
        keyLabel.visible = false

    }
  
    override func onEnter(){
        super.onEnter()
        
        //set up camera with CCActionFollow
        let actionFollow = CCActionFollow(target: hero, worldBoundary: cameraBoundingBox.boundingBox())
        contentNode.runAction(actionFollow)
    }
    
    func jump(){
        
        // run jumping annimation while pushing the character up in the air with physics
            hero.animationManager.runAnimationsForSequenceNamed("Jumping")
            hero.physicsBody.applyImpulse(CGPoint(x: 0, y: 20))
        
    }
    
    func backToStart() {
        let mainScene = CCBReader.loadAsScene("Scenes/MainScene")
        CCDirector.sharedDirector().presentScene(mainScene)
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
            //if the hero is on the far side, more than 1000 points away from the beginning, send them back!
        if hero.position.x > 1000 {
            hero.position.x -= 2500
            //or, if the hero is closer, within 200 points away from the beginning, push them away!
        } else if hero.position.x < 200 {
            hero.position.x += 2550
        }

        return true
    }
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, hero: CCSprite!, key: CCSprite!) -> Bool {
        // allow the user to pick up the key
        key.visible = false
        hasKey = true
        
        //alert user that they do indeed have the key
        keyLabel.visible = hasKey
        
        return true
    }
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, hero: CCSprite!, gate: Gate!) -> Bool {

        if hasKey {
            //play the unlocking door animation
            gate.animationManager.runAnimationsForSequenceNamed("DoorOpening")
            //wait for four seconds while the animation plays
            var delay = CCActionDelay(duration: 4)
            //go back to the main screen
            var goBack = CCActionCallBlock(block: {self.backToStart()})
            runAction(CCActionSequence(array: [delay, goBack]))
            //it has to return something, and we don't want it to return
            return false
        } else {
            //just don't collide if the user didn't get the key
            return false
        }
    }
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, hero: CCSprite!, pitOfDespair: CCNode!) -> Bool {
        //if the hero falls into the abyss, send them back to the beginning of the level
        hero.position.x = 60
        //take off one of their life points and update the life point label
        lifePoints -= 1
        lifeLabel.string = String(lifePoints)
        //return false, i.e, don't actually collide
        return false
    }
}