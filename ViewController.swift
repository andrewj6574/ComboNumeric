//
//  ViewController.swift
//  Combo_Numeric
//
//  Created by John He on 2018-03-21.
//  Copyright © 2018 AJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {

    
    @IBOutlet weak var startButton: UIButton!
    
    let transition = CircularTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        startButton.layer.cornerRadius = startButton.frame.size.width / 2
        startButton.tintColor = UIColor.darkGray
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gameVC = segue.destination as! GameViewController
        gameVC.transitioningDelegate = self
        gameVC.modalPresentationStyle = .custom
    }
    

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = startButton.center
        transition.circleColor = UIColor(red:0.61, green:0.89, blue:0.94, alpha:1.0)
        
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = startButton.center
        transition.circleColor = UIColor(red:0.61, green:0.89, blue:0.94, alpha:1.0)
        
        return transition
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
