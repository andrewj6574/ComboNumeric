//
//  GameScene.swift
//  Combo_Numeric
//
//  Created by AJ on 2017-10-16.
//  Copyright (c) 2017 AJ. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var vc = UIViewController();
    var dictionary = Lexicontext.sharedDictionary();
    
    private func getWord() -> String? {
        return dictionary?.randomWord();
    }
    
    override func didMove(to: SKView) {
        let rows = 5
        let cols = 5
        let tileSize = CGFloat(60.0);
        
        if let grid = Grid(tileSize: tileSize, rows:rows, cols:cols) {
            grid.position = CGPoint(x:frame.midX, y:frame.midY)
            addChild(grid)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       /* Called when a touch begins */
        // obtain a referece to Lexicotext
        
        for touch in touches {
//            let location = touch.location(in: self)
//            let label = SKLabelNode(fontNamed:"Arial")
//            let word = getWord();
//            
//            label.position = location
//            label.fontSize = 12
//            label.text = String(Int(location.x)) + ", " + String(Int(location.y));
//            label.text?.append(word ?? "")
//            label.text?.append(RandomCharacter());
//            
//            self.addChild(label)
            
//            let sprite = SKSpriteNode(imageNamed:"Spaceship")
//            
//            sprite.xScale = 0.5
//            sprite.yScale = 0.5
//            sprite.position = location
//            
//            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
//            	
//            sprite.runAction(SKAction.repeatActionForever(action))
//            
//            self.addChild(sprite)
        }
    }
   
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
    }
}
