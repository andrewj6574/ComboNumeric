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

//    override func didMove(to view: SKView) {
//        /* Setup your scene here */
//        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
//        myLabel.text = "Hello, World!"
//        myLabel.fontSize = 45
//        myLabel.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
//        
//        self.addChild(myLabel)
//    }
    
    override func didMove(to: SKView) {
//        if let grid = Grid(blockSize: 65.0, rows:5, cols:5) {
//            grid.position = CGPoint (x:frame.midX, y:frame.midY)
//            addChild(grid)
//            
//            let gamePiece = SKSpriteNode(imageNamed: "Spaceship")
//            gamePiece.setScale(0.0625)
//            gamePiece.position = grid.gridPosition(row: 1, col: 0)
//            grid.addChild(gamePiece)
//            
//            let letter = SKLabelNode(fontNamed: "ArialMT")
//            letter.text = "Y"
//            letter.fontSize = 30
//            letter.fontColor = SKColor.white
//            letter.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
//            letter.position = grid.gridPosition(row: 2, col: 0)
//
//            
//            grid.addChild(letter)
//        }
        
        let rows = 5
        let cols = 5
        let tileSize = CGFloat(60.0);
        
        if let grid = Grid(tileSize: tileSize, rows:rows, cols:cols) {
            grid.position = CGPoint (x:frame.midX, y:frame.midY)
            addChild(grid)
        }
        
        
//        let gridWidth = tileSize * CGFloat(cols);
//        let gridHeight = tileSize * CGFloat(rows);
//
//        let screenSize = UIScreen.main.bounds
//        let startX = (screenSize.width - gridWidth) / 2
//        let startY = (screenSize.height - gridHeight) / 2
//        for indexX in 0...cols {
//            for indexY in 0...rows {
//                if let tile = Tile(startOffsetX: startX, startOffsetY: startY, indexX: indexX, indexY: indexY, size: tileSize)
//                {
//                    addChild(tile);
//                }
//            }
//        }

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
