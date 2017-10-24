//
//  Grid.swift
//  Combo_Numeric
//
//  Created by John He on 2017-10-18.
//  Copyright 2017 AJ. All rights reserved.

import SpriteKit

class Grid:SKSpriteNode {
    var rows:Int!
    var cols:Int!
    var tileSize:CGFloat!
    
    convenience init?(tileSize:CGFloat,rows:Int,cols:Int) {
        guard let texture = Grid.gridTexture(tileSize: tileSize,rows: rows, cols:cols) else {
            return nil
        }
        self.init(texture: texture, color:SKColor.clear, size: texture.size())
        self.isUserInteractionEnabled = true
        self.tileSize = tileSize
        self.rows = rows
        self.cols = cols
        
        self.addTiles()
    }
    
    class func gridTexture(tileSize:CGFloat,rows:Int,cols:Int) -> SKTexture? {
        // Add 1 to the height and width to ensure the borders are within the sprite
        let size = CGSize(width: CGFloat(cols)*tileSize+1.0, height: CGFloat(rows)*tileSize+1.0)
        UIGraphicsBeginImageContext(size)
        	
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        let bezierPath = UIBezierPath()
        let offset:CGFloat = 0.5
        
        let x1 = offset
        let x2 = CGFloat(cols)*tileSize + offset
        let y1 = offset
        let y2 = CGFloat(rows)*tileSize + offset

        bezierPath.move(to: CGPoint(x: x1, y: 0))
        bezierPath.addLine(to: CGPoint(x: x1, y: size.height))
        
        bezierPath.move(to: CGPoint(x: x2, y: 0))
        bezierPath.addLine(to: CGPoint(x: x2, y: size.height))
        
        bezierPath.move(to: CGPoint(x: 0, y: y1))
        bezierPath.addLine(to: CGPoint(x: size.width, y: y1))
        
        bezierPath.move(to: CGPoint(x: 0, y: y2))
        bezierPath.addLine(to: CGPoint(x: size.width, y: y2))
        
        SKColor.white.setStroke()
        bezierPath.lineWidth = 1.0
        bezierPath.stroke()
        context.addPath(bezierPath.cgPath)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return SKTexture(image: image!)
    }
    
    func addTiles() {
        
        let gridWidth = tileSize * CGFloat(cols);
        let gridHeight = tileSize * CGFloat(rows);

        let screenSize = UIScreen.main.bounds
        let startX = frame.midX - (gridWidth/2.5)
        let startY = frame.midY - (gridHeight/2.5)
        for indexX in 0...(cols-1) {
            for indexY in 0...(rows-1) {
                if let tile = Tile(startOffsetX: startX, startOffsetY: startY, indexX: indexX, indexY: indexY, size: tileSize)
                {
                    addChild(tile);
                }
            }
        }
    }

    func gridPosition(row:Int, col:Int) -> CGPoint {
        let offset = tileSize / 2.0 + 0.5
        let x = CGFloat(col) * tileSize - (tileSize * CGFloat(cols)) / 2.0 + offset
        let y = CGFloat(rows - row - 1) * tileSize - (tileSize * CGFloat(rows)) / 2.0 + offset
        return CGPoint(x:x, y:y)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let position = touch.location(in:self)
            let node = atPoint(position)
            if node != self {
                let action = SKAction.rotate(byAngle:CGFloat.pi*2, duration: 1)
                node.run(action)
            }
            else {
                let x = size.width / 2 + position.x
                let y = size.height / 2 - position.y
                let row = Int(floor(y / tileSize))
                let col = Int(floor(x / tileSize))
                
                appendAlphabetNode(row: row, col: col);
                print("\(row) \(col)")
            }
        }
    }
    
    func appendAlphabetNode(row: Int, col: Int) {
        let letters = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
        let x = randomInt(min: 0, max: 25);
        print(letters[x]);

        let letter = SKLabelNode(fontNamed: "ArialMT")
        letter.text = letters[x]
        letter.fontSize = 30
        letter.fontColor = SKColor.white
        letter.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
        letter.position = self.gridPosition(row: row, col: col)
        
        self.addChild(letter)
    }
    
    func randomInt(min: Int, max:Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
}
