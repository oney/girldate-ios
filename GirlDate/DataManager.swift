//
//  DataStore.swift
//  GirlDate
//
//  Created by YANG WAN-HUANG on 2015/1/15.
//  Copyright (c) 2015年 ithink. All rights reserved.
//

import UIKit

private let _DataManagerSharedInstance = DataManager()

class DataManager: NSObject {
    
    class var sharedInstance : DataManager {
        
        return _DataManagerSharedInstance
    }
    
    func isLogin() -> Bool {
        var ud = NSUserDefaults.standardUserDefaults()
        if ud.objectForKey("isLogin") != nil {
            return true
        }
        return false
    }
}
