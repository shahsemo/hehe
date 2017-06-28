//
//  RegistrationViewController.swift
//  ShareATextbook
//
//  Created by Tan QingYu on 20/6/17.
//  Copyright © 2017 Chia Li Yun. All rights reserved.
//

import UIKit


class RegistrationViewController: UIViewController, BEMCheckBoxDelegate {
    
    
    @IBOutlet weak var nameTextField : UITextField!
    @IBOutlet weak var createButton : UIButton!
    @IBOutlet weak var emailTextField : UITextField!
    @IBOutlet weak var passwordTextField : UITextField!
    @IBOutlet weak var phoneTextField : UITextField!
    @IBOutlet weak var confirmPasswordField : UITextField!
    
    @IBOutlet weak var TOSBox: BEMCheckBox!
    
    
    
    var usernameField : String = ""
    var emailField : String = ""
    var phoneField : String = ""
    var passwordField : String = ""
    var confirmField : String = ""
    var agreeToTOS : Bool = true
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        TOSBox.delegate = self
        view.backgroundColor = UIColor(r: 240, g: 240, b: 240)
        
    
        setupNavigationBar()
        
        
    }
    
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        TOSBox.setOn(true, animated: true)
//    }
//    
    
    

    
    // Function to create users
    @IBAction func createUser() {
        
        // Put text fields value into the variables
            usernameField = nameTextField.text!
            passwordField = passwordTextField.text!
            emailField = emailTextField.text!
            phoneField = passwordTextField.text!
            confirmField = confirmPasswordField.text!
        
        
        // Check if password field matches confirm field
            if passwordField == confirmField {
                
                // Convert password to SHA512
                    passwordField = maskPassword(passwordField)
                    confirmField = maskPassword(confirmField)
            }
        
        
        print("\(usernameField) \n")
        print("\(passwordField) \n")
        print("\(emailField) \n")
        print("\(phoneField) \n")
        
        
    }
    
    // Create function for convert password
    // to SHA512 as an requirement
    func maskPassword(_ password: String) -> String {
            return sha512Hex(string: password)
        }
    

    
    
    // Create function to check if password match
    // If password is true, returns.
        func checkPasswordMatch() -> Bool {
            
            if passwordField == confirmField {
                return true
            } else {
                return false
            }
            
            
        }
    
    // Create function to check if the fields are filled
    // If fields are filled, return true.
        func checkAllFieldsRequired() -> Bool {
            
            var message = ""
            var validFormat = false
            
            if usernameField.isEmpty == true { message = "Username is required" }
            else if isValidEmail(emailField) != true { message = "Email is required/invalid" }
            else if phoneField.isEmpty == true { message = "Phone number is required"}
            else if passwordField != confirmField { message = "Password does not match" }
            else if agreeToTOS == false { message = "Must agree to the terms" }
            else { validFormat = true }
            
            let uiAlert = UIAlertController(
                title: "Required Fills",
                message: message,
                preferredStyle: UIAlertControllerStyle.alert)
            
            uiAlert.addAction(UIAlertAction(title: "Ok", style: .default,handler: nil))
            self.present(uiAlert, animated:true, completion: nil)
                
        
            return validFormat
            
        }

    
    // Create function to check if username exists in the database
    func checkUserExist() -> Bool {
        return false
    }
    
    // Function to check if checkbox is checked.
    func didTap(_ checkBox: BEMCheckBox) {
        if(checkBox.on) {
            agreeToTOS = true
            print(agreeToTOS)
        } else {
            agreeToTOS = false
            print(agreeToTOS)
        }
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
    
    // Set up the navigation bar
    func setupNavigationBar() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Login", style: .plain, target: nil, action: nil )
       
        
      
    }
    
    
    // Override func for exit edit when on textfield
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    
    
    func isValidEmail(_ email: String) -> Bool {
        return email.characters.count > 0 && NSPredicate(format: "self matches %@", "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,64}").evaluate(with: email)
    }
    
    func isValidField(_ fields: String) -> Bool {
        return fields.characters.count > 4 && fields.rangeOfCharacter(from: .whitespacesAndNewlines) == nil
    }
    
    
    
}




extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}



