//
//  InviteViewController.swift
//  GirlDate
//
//  Created by YANG WAN-HUANG on 2015/1/15.
//  Copyright (c) 2015年 ithink. All rights reserved.
//

import UIKit

class InviteViewController: UIViewController {

    @IBOutlet weak var datePickerWrapper: UIView!
    @IBOutlet weak var datePickerConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonDate(button: UIButton) {
        NSLog("ee")
        datePickerWrapper.hidden = false
        view.setNeedsUpdateConstraints()
        datePickerConstraint.constant = 0.0
        UIView.animateWithDuration(0.3, animations: {
            self.view.layoutIfNeeded()
        });
        
    }
    @IBAction func dateDone(button: UIButton) {
        view.setNeedsUpdateConstraints()
        datePickerConstraint.constant = -206.0
        UIView.animateWithDuration(0.3, animations: {
            self.view.layoutIfNeeded()
        }, completion: { (finished: Bool) in
            self.datePickerWrapper.hidden = true
        
        })
        
    }
    @IBAction func searchFriend(button: UIButton) {
        performSegueWithIdentifier("pushSearchFriend", sender: nil)
    }
    @IBAction func selectRestaurant(button: UIButton) {
        performSegueWithIdentifier("pushRestaurant", sender: nil)
    }
    
}
