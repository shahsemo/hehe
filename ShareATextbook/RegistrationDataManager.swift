//
//  RegistrationDataManager.swift
//  ShareATextbook
//
//  Created by Tan QingYu on 28/6/17.
//  Copyright © 2017 Chia Li Yun. All rights reserved.
//

import Foundation

class registrationDA: NSObject {
    
    
    
    override init() {
        
    }
    
    static func createUser(_ name: String, _ email: String, _ password: String, _ phone: String, _ showEmail: String, _ showPhone: String, _ type: String) -> Bool {
        
        var isCreated : Bool = false
        
        
        
        let json = JSON.init([
            "name" : name,
            "email" : email,
            "password" : password,
            "phone" : phone,
            "showemail" : showEmail,
            "showphone" : showPhone,
            "type" : type
            ])
        
        DispatchQueue.global(qos: .background).async {
            HTTP.postJSON(url: "http://13.228.39.122/FP05_883458374658792/1.0/user/add", json: json, onComplete: {
                json, response, error in
                
                if response != nil
                {
                    isCreated = false
                    return
                    
                }
                
                if json != nil {
                    print(json!)
                    
                }
                isCreated = true
            })
            
            
            print(isCreated)
        } // End of Dispatch Queue
        
        isCreated = true
        
        
        return isCreated
    }
    
    
    
    
    
    
    func loginAndPost(_ email: String, _ password: String) -> Bool {
        
        let posted = false
        
        var nonce : String = ""
        
        let json = JSON.init([
            "email" : email
            ])
        
        DispatchQueue.global(qos: .background).async {
            HTTP.postJSON(url: "http://13.228.39.122/FP05_883458374658792/1.0/user/getnonce", json: json, onComplete: {
                json, response, error in
                
                if response != nil
                {
                    return
                }
                
                if json != nil {
                    print(json!)
                    nonce = (json!["nonce"].string!)
                    print(nonce)
                }
                
                
                
                
                
            })
        } // End of Dispatch Queue
        
        
        
        return posted
        
    }
    
    
    
    
    
}
