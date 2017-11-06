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
    var m_LetterLabel:SKLabelNode?
    var m_Active:Bool!
    
    var hasValue = false
    
    convenience init?(grid:Grid, startOffsetX:CGFloat, startOffsetY:CGFloat, indexX:Int, indexY:Int, size:CGFloat)
    {
        guard let texture = Tile.Texture(size:size) else {
            return nil
        }
        self.init(texture: texture, color:SKColor.blue, size:texture.size())
        self.isUserInteractionEnabled = true
        self.m_Grid = grid
        self.m_startOffsetX = startOffsetX
        self.m_startOffsetY = startOffsetY
        self.m_indexX = indexX;
        self.m_indexY = indexY;
        self.m_Size = size
        self.m_Active = false
        
        let posX = startOffsetX + CGFloat(indexX) * size;
        let posY = startOffsetY + CGFloat(indexY) * size;
        position = CGPoint(x: posX, y: posY);
        
        appendAlphabetNode(row: m_indexY, col: m_indexX);	
    }
    
    class func Texture(size:CGFloat) -> SKTexture?
    {
        UIGraphicsBeginImageContext(CGSize(width:size, height:size))
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        
        let bezierPath = UIBezierPath()
        DrawLine(bez: bezierPath, sx: 0,    sy: 0,    ex:  0,   ey: size)
        DrawLine(bez: bezierPath, sx: 0,    sy: 0,    ex: size, ey:  0)
        DrawLine(bez: bezierPath, sx: size, sy: size, ex:  0,   ey: size)
        DrawLine(bez: bezierPath, sx: size, sy: size, ex: size, ey:  0)

        SKColor.white.setStroke()
        bezierPath.lineWidth = 2.0
        bezierPath.stroke()
        context.addPath(bezierPath.cgPath)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return SKTexture(image: image!)
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
                
                let action = SKAction.rotate(byAngle:CGFloat.pi*2, duration: 1)
                //            self.run(action)
                self.m_LetterLabel?.run(action);
                
                let colorizeAction = SKAction.colorize(with: UIColor.red, colorBlendFactor: 1, duration: 1)
                self.m_LetterLabel?.run(colorizeAction)
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
    
    func reinit() {
        self.removeAllActions()
        m_LetterLabel?.removeAllActions()
        m_LetterLabel?.zRotation = 0
        m_LetterLabel?.color = SKColor.white
        self.color = SKColor.white
    }
    
    func appendAlphabetNode(row: Int, col: Int) {
        let letters = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
        let x = randomInt(min: 0, max: 25);
        print(letters[x]);
        
        m_LetterLabel = SKLabelNode(fontNamed: "ArialMT")
        m_LetterLabel?.text = letters[x]
        m_LetterLabel?.fontSize = 30
        m_LetterLabel?.fontColor = SKColor.white
        m_LetterLabel?.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
        m_LetterLabel?.isUserInteractionEnabled = false
        
        self.hasValue = true
        self.addChild(m_LetterLabel!)
    }
    
    func randomInt(min: Int, max:Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
}
