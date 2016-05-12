//
//  ViewController.swift
//  SwiftPtyxiaki
//
//  Created by Alexandros Lykostratis on 11/05/16.
//  Copyright © 2016 Alexlykos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var navigationBar: UINavigationBar!
    
    @IBOutlet weak var welcomeMessageLabel: UILabel!
    
    @IBOutlet weak var drumMachineButton: UIButton!
    
    @IBOutlet weak var pianoKeyboardButton: UIButton!
    
    @IBAction func drumMachineButtonPressed(sender: UIButton) {
    }
    
    @IBAction func pianoKeyboardButtonPressed(sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationBar.barStyle = UIBarStyle.Default
        self.navigationBar.barTintColor = UIColor.blueColor()
        self.navigationBar.translucent = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

