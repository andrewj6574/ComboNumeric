//
//  MenuScene.swift
//  Combo_Numeric
//
//  Created by John He on 2018-03-21.
//  Copyright © 2018 AJ. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    var titleLabel: SKLabelNode!
    var scoreLabel: SKLabelNode!
    var newGameButton:SKSpriteNode!
    var endButton: UIButton!
    var isGameOver: Bool!
    var score: Int = 0
    
    override func sceneDidLoad() {
        print("loaded")
    }
    
    override func didMove(to view: SKView) {
        titleLabel = self.childNode(withName: "title") as! SKLabelNode
        scoreLabel = self.childNode(withName: "scoreLabel") as! SKLabelNode
        newGameButton = self.childNode(withName: "newGameButton") as! SKSpriteNode
        
        self.endButton.isHidden = false
        
        if isGameOver == true {
            titleLabel.text = "GGWP!"
            scoreLabel.text = "Score: \(score)"
        } else {
            titleLabel.text = "Combo Numerics"
            scoreLabel.text = ""
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        
        if let location = touch?.location(in: self) {
            let nodesArray = self.nodes(at: location)
            
            if nodesArray.first?.name == "newGameButton" {
                let transition = SKTransition.doorsOpenHorizontal(withDuration: 0.5)
                let gameScene = GameScene(size: self.size)
                
                endButton.isHidden = true
                gameScene.endButton = endButton
                
                self.view?.presentScene(gameScene, transition: transition)
                
                
            }
            
        }
    }
    
}
