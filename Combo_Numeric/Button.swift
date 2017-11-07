//
//  Button.swift
//  Combo_Numeric
//
//  Created by AJ on 2017-11-05.
//  Copyright © 2017 AJ. All rights reserved.
//

import Foundation
import SpriteKit

class Button : SKSpriteNode
{
    var m_Grid:Grid?
    var m_Size:CGFloat!
    var m_Active:Bool!
    var m_Text:SKLabelNode!
    var m_Callback: (() -> Void)!
    
    convenience init?(text:String, posX:Int, posY:Int, size:CGFloat, callback: @escaping () -> Void)
    {
        guard let texture = Button.Texture(size:size) else {
            return nil
        }
        self.init(texture: texture, color:SKColor.blue, size:texture.size())
        
        self.isUserInteractionEnabled = true
        self.m_Size = size
        self.m_Active = false
        self.m_Callback = callback
        
        position = CGPoint(x: posX, y: posY);
        setText(text: text)
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
            print("Button Pressed")
            m_Callback()
        }
    }
    
    func setText(text: String) {
        let m_Text = SKLabelNode(fontNamed: "ArialMT")
        m_Text.text = text
        m_Text.fontSize = 30
        m_Text.fontColor = SKColor.white
        m_Text.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
        m_Text.isUserInteractionEnabled = false
        
        self.addChild(m_Text)
    }
    
}
