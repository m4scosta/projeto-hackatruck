//
//  ViewController.swift
//  projeto-hackatruck
//
//  Created by Student on 14/12/15.
//  Copyright © 2015 organization. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func toggleRanging(sender: AnyObject) {
        BeaconController.instance.toggle()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

