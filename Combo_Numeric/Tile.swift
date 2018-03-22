	//
//  Tile.swift
//  Combo_Numeric
//
//  Created by AJ on 2017-10-22.
//  Copyright © 2017 AJ. All rights reserved.
//

import SpriteKit

class Tile : SKSpriteNode
{
    var m_Grid:Grid?
    var m_startOffsetX:CGFloat!
    var m_startOffsetY:CGFloat!
    var m_indexX:Int!
    var m_indexY:Int!
    var m_Size:CGFloat!
    var m_LetterLabel:SKLabelNode!
    var m_Active:Bool!

    
    var hasValue = false
    
    convenience init?(grid:Grid, startOffsetX:CGFloat, startOffsetY:CGFloat, indexX:Int, indexY:Int, size:CGFloat)
    {
        self.init(imageNamed: "Tile")
        self.isUserInteractionEnabled = true
        self.m_Grid = grid
        self.m_startOffsetX = startOffsetX
        self.m_startOffsetY = startOffsetY
        self.m_indexX = indexX;
        self.m_indexY = indexY;
        self.m_Size = size
        self.m_Active = false
        
        self.m_LetterLabel = SKLabelNode(fontNamed: "ArialMT")
        addChild(self.m_LetterLabel)
        
        let posX = startOffsetX + CGFloat(indexX) * size;
        let posY = startOffsetY + CGFloat(indexY) * size;
        position = CGPoint(x: posX, y: posY);
        
        appendAlphabetNode(row: m_indexY, col: m_indexX);	
    }
    
    class func DrawLine(bez: UIBezierPath, sx: CGFloat, sy: CGFloat, ex: CGFloat, ey: CGFloat)
    {
        bez.move(to: CGPoint(x: sx, y: sy))
        bez.addLine(to: CGPoint(x: ex, y: ey))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
//            let position = touch.location(in:self)
//            let node = atPoint(position)
            
            if (!m_Active!) {
                m_Active = true;
                print(String(m_indexX) + ", " + String(m_indexY))
                
//                let action = SKAction.rotate(byAngle:CGFloat.pi*2, duration: 1)
//                self.m_LetterLabel.run(action);
                let colorizeAction = SKAction.colorize(with: UIColor.darkGray, colorBlendFactor: 1, duration: 0.1)
                self.m_LetterLabel.fontColor = UIColor.white
                self.run(colorizeAction)
                m_Grid?.addToActiveTileList(tile: self)
            }
//            if node != self {
//                let action = SKAction.rotate(byAngle:CGFloat.pi*2, duration: 1)
//                node.run(action)
//            }
//            else {
//                
//                if (!self.hasValue) {
//                    appendAlphabetNode(row: m_indexY, col: m_indexX)
//                }
//            }
        }
    }
    
    func setActive(flag: Bool) {
        m_Active = flag
    }
    
    func getActive() -> Bool! {
        return m_Active;
    }
    
    func reinit(newWord:Bool = false) {
        if (newWord) {
            self.m_LetterLabel.text = getRandomLetter()
            
        }
        self.m_LetterLabel.fontColor = SKColor.white
        self.color = SKColor.white
        self.m_LetterLabel.zPosition = 100
        self.removeAllActions()
        self.m_LetterLabel.removeAllActions()

    }
    
    func updateLetterNode(zRotation:Int = 0, color:SKColor = SKColor.white, text:String = "") {
//        let updateText = SKAction.setValue(text, forKey: "text")
          self.m_LetterLabel.text = text
          self.m_LetterLabel.fontColor = color
        
//        self.m_LetterLabel.setValue(color, forKey: "color")
//        self.m_LetterLabel.setValue(text, forKey: "text")
//        self.m_LetterLabel.run(updateText)
    }
    
    func refreshLetter() {
        self.updateLetterNode(text: getRandomLetter())
        
    }
    
    func appendAlphabetNode(row: Int, col: Int) {
        self.m_LetterLabel = SKLabelNode(fontNamed: "ArialMT")
        self.m_LetterLabel.text = getRandomLetter()
        self.m_LetterLabel.fontSize = 30
        self.m_LetterLabel.fontColor = SKColor.white
        self.m_LetterLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
        self.m_LetterLabel.isUserInteractionEnabled = false
        
        self.hasValue = true
        self.addChild(m_LetterLabel!)
    }
    
    func randomInt(min: Int, max:Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
    func getRandomLetter() -> String {
        let letters = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
        let x = randomInt(min: 0, max: 25);
        return letters[x]
    }
    
}
