//
//  Hero.swift
//  Mirror
//
//  Created by Olivia Ross on 7/9/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Hero: CCSprite {
    func moveLeft() {
        position.x += 10
    }
    
    func moveRight() {
       position.x -= 10
    }
    
    func jump() {
        self.physicsBody.applyImpulse(CGPoint(x: 0, y: 2000))
    }
}
