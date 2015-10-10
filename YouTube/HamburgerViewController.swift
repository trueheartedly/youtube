//
//  HamburgerViewController.swift
//  YouTube
//
//  Created by James Taylor on 10/8/15.
//  Copyright © 2015 James Taylor. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {
    
    
    @IBOutlet weak var feedView: UIView!
    @IBOutlet weak var menuView: UIView!
    
    
    var menuViewController: UIViewController!
    var feedViewController: UIViewController!
    
    var initialX: CGFloat!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        initialX = menuView.frame.origin.x
        
        
        
        
        menuViewController = storyboard.instantiateViewControllerWithIdentifier("MenuViewController")
        
        addChildViewController(menuViewController)
        
        menuView.addSubview(menuViewController.view)
        
        menuViewController.didMoveToParentViewController(self)
        
        
        feedViewController = storyboard.instantiateViewControllerWithIdentifier("FeedViewController")
        
        addChildViewController(feedViewController)
        
        feedView.addSubview(feedViewController.view)
        
        feedViewController.didMoveToParentViewController(self)
        
        
        
        
    }
    
    @IBAction func panMenu(sender: UIPanGestureRecognizer) {
        let velocity = sender.velocityInView(view)
        let translation = sender.translationInView(view)
        let location = sender.locationInView(view)
        
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / 500.0
        transform = CATransform3DRotate(transform, CGFloat(35 * M_PI / 180), 0, 1, 0)
        
        if sender.state == UIGestureRecognizerState.Began {
            menuView.transform = CGAffineTransformMakeScale(0.9, 0.9)
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            if velocity.x > 0.0 {
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.feedView.frame.origin.x = 280
                    self.menuView.transform = CGAffineTransformMakeScale(1.0, 1.0)
                    //self.feedView.layer.transform = transform

                })
            }else if velocity.x < 1.0 {
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.feedView.frame.origin.x = 0
                    self.menuView.transform = CGAffineTransformMakeScale(0.9, 0.9)
                })
            }
            
        }
    }
    
}
