//
//  LevelSelect.swift
//  Mirror
//
//  Created by Olivia Ross on 7/9/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class LevelSelect: CCScene {
    
    func backToStart() {
        let mainScene = CCBReader.loadAsScene("Scenes/MainScene")
        CCDirector.sharedDirector().presentScene(mainScene)
    }
    
    func goToLevelOne() {
        let gameplay = CCBReader.loadAsScene("Scenes/Gameplay")
        CCDirector.sharedDirector().presentScene(gameplay)
    }
}
