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
        hero.position.x -= 10
        hero.animationManager.runAnimationsForSequenceNamed("WalkingRight")

    }
    
    func moveRight() {
        hero.position.x += 10
        hero.animationManager.runAnimationsForSequenceNamed("WalkingLeft")
    }
    
    func jump() {
        hero.animationManager.runAnimationsForSequenceNamed("Jumping")
        hero.physicsBody.applyImpulse(CGPoint(x: 0, y: 200))
    }
    
    //CAN'T TELL IF THE JEWEL IS AN ITEM OR A CONTROL
        //MAKE THE GROUND TALLER, PUT THE JEWEL IN THE GROUND
        //MAKE THE JUMP BUTTON MORE OBVIOUS, MAYBE AN "UP" ARROW?
    //IF YOU'RE FACING LEFT, YOU TURN AROUND WHEN YOU JUMP
    //DON'T LET THEM WALK OFF THE WORLD
    //TOO SLOW
    //PLAYER SHOULD KEEP WALKING WHEN BUTTON IS HELD
    //ANIMATION CONTINUES AFTER YOU'VE STOPPED PRESSING THE BUTTON

}