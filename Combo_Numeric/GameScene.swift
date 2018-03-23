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
    
    var defaultTime = 60

    var timeCounter = 0
    
    var gameTimer:Timer!
    
    var endButton: UIButton!
    
    var _Grid: Grid!
    
    var exitButton: Button!
    
    lazy var timerLabel:SKLabelNode = {
        let label = SKLabelNode(fontNamed: "ArialMT")
        label.fontSize = 30
        label.zPosition = 2
        label.color = SKColor.white
        label.horizontalAlignmentMode = .right
        label.verticalAlignmentMode = .top
        label.text = ""
        
        return label
    }()
    
    private func getWord() -> String? {
        return dictionary?.randomWord();
    }

    override func didMove(to: SKView) {
        let rows = 5
        let cols = 5
        let tileSize = CGFloat(60.0);
        
        if let grid = Grid(tileSize: tileSize, rows:rows, cols:cols) {
            _Grid = grid //Global
            
            grid.position = CGPoint(x:frame.midX, y:frame.midY)
            
            addChild(grid)
            
            let colorize = SKAction.colorize(with: UIColor.white, colorBlendFactor: 1.0, duration: 5)
            
            grid.refreshGridButton?.run(colorize)
            
            timerLabel.position = CGPoint(x:UIScreen.main.bounds.width * 0.9, y: UIScreen.main.bounds.height * 0.9)
            
            timerLabel.text = "\(defaultTime)"
            
            addChild(timerLabel)
            
            if let exitButton = Button( text: "X", posX: Int(UIScreen.main.bounds.width - 25), posY: Int(UIScreen.main.bounds.height - 25), size: 50, callback: endGame)
            {
                self.addChild(exitButton)
            }
            
            if gameTimer == nil {
                timeCounter = defaultTime
                startGameTimer()
                
            }
        }
        
    }
    
    override func sceneDidLoad() {
        print("SceneDidLoad")
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
    
    func startGameTimer() {
        gameTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(decrementCounter), userInfo: nil, repeats: true)
        
    }
    
    func stopGameTimer() {
        if gameTimer != nil {
            gameTimer.invalidate()
            gameTimer = nil
        }
    }
    
    @objc func decrementCounter() {
        timeCounter -= 1
        timerLabel.text  = "\(timeCounter)"
        
        if timeCounter == 0 && gameTimer != nil {
            //End game
            print("stoped")
            
            stopGameTimer()
            
            endGame()
            
        }
    }
    
    func endGame(){
        stopGameTimer()

        if let endGameScene = SKScene(fileNamed: "MenuScene") as? MenuScene {
            endGameScene.endButton = self.endButton
            endGameScene.isGameOver = true
            endGameScene.score = _Grid.scoreCount
            
            let reveal = SKTransition.reveal(with: .down,
                                             duration: 1)
            
            self.view?.presentScene(endGameScene, transition: reveal)
        }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
    }
}
