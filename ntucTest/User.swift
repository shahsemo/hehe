//
//  User.swift
//  ntucTest
//
//  Created by Chia Li Yun on 30/4/17.
//  Copyright © 2017 Chia Li Yun. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var username : String
    var password : String
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
        
        super.init()
    }

}
