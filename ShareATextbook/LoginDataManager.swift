////
////  LoginDataManager.swift
////  ShareATextbook
////
////  Created by Shah on 4/7/17.
////  Copyright © 2017 Chia Li Yun. All rights reserved.
////
//
//import Foundation
//
//class loginDA: NSObject {
//    
//    override init() {
//        
//    }
//    
//    static func loginUser(_ type: String, _ socialtoken: String, _ email: String, _ password: String ) -> Bool
//    {
//        var isLoggedIn : Bool = false
//        
//        var nonce : String = ""
//        
//        let json = JSON.init([
//            "type" : type,
//            "socialtoken" : socialtoken,
//            "email" : email,
//            "password" : password
//            ])
//        
//        DispatchQueue.global(qos:å .background).async {
//            HTTP.postJSON(url: "http://13.228.39.122/FP05_883458374658792/1.0/user/getnonce", json: json, onComplete: {
//                json, response, error in
//                
//                if response != nil
//                {
//                    print(json!)
//                    nonce = (json!["nonce"].string!)
//                    print(nonce)
//                }
//            })
//        }
//        
//        DispatchQueue.global(qos: .background).async {
//            HTTP.postJSON(url: "http://13.228.39.122/FP05_883458374658792/1.0/user/login", json: json, onComplete: {
//                json, response, error in
//                
//                if response != nil
//                {
//                    isLoggedIn = false
//                    return
//                }
//                
//                if json != nil {
//                    print(json!)
//                }
//                isLoggedIn = true
//            })
//            print(isLoggedIn)
//        } // End of Dispatch Queue
//        
//        isLoggedIn = true
//        
//        return isLoggedIn
//    }
//    
//    
//}
