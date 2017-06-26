//
//  RegistrationViewController.swift
//  ShareATextbook
//
//  Created by Tan QingYu on 20/6/17.
//  Copyright © 2017 Chia Li Yun. All rights reserved.
//

import UIKit


class RegistrationViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField : UITextField!
    @IBOutlet weak var createButton : UIButton!
    @IBOutlet weak var emailTextField : UITextField!
    @IBOutlet weak var passwordTextField : UITextField!
    @IBOutlet weak var phoneTextField : UITextField!
    @IBOutlet weak var confirmPasswordField : UITextField!
    
    var usernameField : String = "asd"
    var emailField : String = "asd"
    var phoneField : String = "asd"
    var passwordField : String = "asd"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor(r: 240, g: 240, b: 240)
        
        print(usernameField)
        print(passwordTextField)
        print(emailField)
        print(phoneField)
        
        
        
        
    }
    
    
    
    
   
    @IBAction func createUser() {
        
        
        usernameField = nameTextField.text!
        passwordField = passwordTextField.text!
        emailField = emailTextField.text!
        phoneField = passwordTextField.text!
        
        
        print(usernameField)
        print(passwordTextField)
        print(emailField)
        print(phoneField)
        
//        var usersList: [User]?
//        
//       
//        
//       let users = User(
//        username: usernameField,
//        password: passwordField,
//        email: emailField,
//        phone: phoneField
//        )
//        
//        usersList!.append(users)
        
        DispatchQueue.global(qos: .background).async {
            HTTP.postJSON(url: "http://13.228.39.122/FP05_883458374658792/1.0/user/add", json: JSON.init([
                
                
                ]), onComplete: {
                json, response, error in
                
                if response == nil
                {
                    return
                }
                
                
                
                print(response!)
                
            })
        } // End of Dispatch Queue
        
    }
    
    // Create function for convert password
    // to SHA512 as an requirement
    func maskPassword() -> String {
        return ""
    }
    

    
    
    // Create function to check if password match
    // If password is true, returns.
    func checkPasswordMatch() -> Bool {
        return false
    }
    
    // Create function to check if the fields are filled
    // If fields are filled, return true.
    func checkAllFieldsRequired() -> Bool {
        
        
        return false
    }

    
    // Create function to check if username exists in the database
    func checkUserExist() -> Bool {
        return false
    }
    
    
}




extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
