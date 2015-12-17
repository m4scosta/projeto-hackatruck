//
//  ViewController.swift
//  projeto-hackatruck
//
//  Created by Student on 14/12/15.
//  Copyright © 2015 organization. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var toggleRangingB: UIButton!
    
    var frame: CGRect!
    
    @IBAction func toggleRanging(sender: AnyObject) {
        BeaconController.instance.toggle()

        if (BeaconController.instance.working) {
            animateButton()
        } else {
            self.toggleRangingB.layer.removeAllAnimations()
            self.toggleRangingB.layer.frame = frame
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        BeaconController.instance.currentViewController = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        if (BeaconController.instance.working) {
            animateButton()
        }
    }
    
    func animateButton(){
        
        self.toggleRangingB.transform = CGAffineTransformMakeScale(0.7, 1)
        self.frame = self.toggleRangingB.layer.presentationLayer()?.frame
        
        UIView.animateWithDuration(5,
            delay:0,
            usingSpringWithDamping: CGFloat(0.2),
            initialSpringVelocity: CGFloat(0.2),
            options: UIViewAnimationOptions.AllowUserInteraction,
            animations: {
                self.toggleRangingB.transform = CGAffineTransformIdentity
            },
            completion:{ finished in
                if (finished) {
                 self.animateButton()
                }
            })
    }
}