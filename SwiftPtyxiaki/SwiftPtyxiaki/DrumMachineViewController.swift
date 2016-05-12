//
//  drumMachineViewController.swift
//  SwiftPtyxiaki
//
//  Created by Alexandros Athanasiadis on 5/12/16.
//  Copyright © 2016 Alexlykos. All rights reserved.
//

import Foundation
import UIKit

class DrumMachineViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBAction func backButtonPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Landscape
    }
    
}