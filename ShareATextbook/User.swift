//
//  User.swift
//  ntucTest
//
//  Created by Chia Li Yun on 30/4/17.
//  Copyright © 2017 Chia Li Yun. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var username : String = ""
    var password : String = ""
    var image : String = ""
    var email : String = ""
    var phone : String = ""
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
        
        super.init()
    }
    
    
    init(username: String, password: String, email: String, phone: String) {
        self.username = username
        self.password = password
        self.email = email
        self.phone = phone
        
        super.init()
    }

}
