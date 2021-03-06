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
                    print(json!)
                    if let token = (json?["token"].string!) {
                          print(token)
                    }
                    if let userId = (json?["id"].string!) {
                        print(userId)
                    }
                    
                  
                    
                    
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
        
        var posted = false
        
        var nonce : String = ""
        let userType = "E"
        
        let json = JSON.init([
            "email" : email
            ])
        
        DispatchQueue.global(qos: .background).async{
            HTTP.postJSON(url: "http://13.228.39.122/FP05_883458374658792/1.0/user/getnonce", json: json, onComplete: {
                json, response, error in
                
                if response != nil
                {
                    print(json!)
                    let nonce = (json!["nonce"].string!)
                    print(nonce)
                    
                    let hashedPassword = self.sha512Hex(string: (self.sha512Hex(string: password).uppercased() + nonce )).uppercased()
                    
                    let loginJson = JSON.init([
                        "type" : userType,
                        "email" : email,
                        "password" : hashedPassword
                        ])
                    
                    HTTP.postJSON(url: "http://13.228.39.122/FP05_883458374658792/1.0/user/login", json: loginJson, onComplete: {
                        json, response, error in
                        
                        if response != nil
                        {
                            print(json!)
                            return
                        }
                        
                        
                    })
                    
                    posted = true
                    return
                }
                
            })
            
            
        } // End of Dispatch Queue
        
        print(posted)
        return posted
        
    }
    
    // Function to convert String to SHA512
    func sha512Hex(string: String) -> String {
        let data = string.data(using: .utf8)!
        
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA512_DIGEST_LENGTH))
        
        data.withUnsafeBytes({
            _ = CC_SHA512($0, CC_LONG(data.count), &digest)
        })
        
        var digestHex = ""
        for index in 0..<Int(CC_SHA512_DIGEST_LENGTH) {
            digestHex += String(format: "%02x", digest[index])
        }
        
        return digestHex
    }
    

    
    
    
}
