//
//  GameViewController.swift
//  Combo_Numeric
//
//  Created by AJ on 2017-10-16.
//  Copyright (c) 2017 AJ. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController, UIViewControllerTransitioningDelegate{
    
    @IBOutlet weak var endButton: UIButton!
    public var skView: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let scene = SKScene(fileNamed: "MenuScene") as? MenuScene {
            scene.endButton = endButton
            scene.isGameOver = false
            scene.backgroundColor = UIColor(red:0.61, green:0.89, blue:0.94, alpha:1.0)
            
            skView = view as! SKView
            skView.presentScene(scene)
        }
    
    }

    @IBAction func endGameVC(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    override var shouldAutorotate : Bool {
        return true
    }

    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden : Bool {
        return true
    }
}
