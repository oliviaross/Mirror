import Foundation

class MainScene: CCScene {

    func startGame() {
        let gameplayScene = CCBReader.loadAsScene("Scenes/Gameplay")
        CCDirector.sharedDirector().presentScene(gameplayScene)

    }
}
