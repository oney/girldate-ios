//
//  InviteTabViewController.swift
//  GirlDate
//
//  Created by YANG WAN-HUANG on 2015/1/15.
//  Copyright (c) 2015年 ithink. All rights reserved.
//

import UIKit

class InviteTabViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func invite(button: UIButton) {
        if button.tag == 101 {
            self.performSegueWithIdentifier("modalNormalInvite", sender: nil)
        }
    }
    
}
