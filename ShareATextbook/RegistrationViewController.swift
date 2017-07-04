//
//  RegistrationViewController.swift
//  ShareATextbook
//
//  Created by Tan QingYu on 20/6/17.
//  Copyright © 2017 Chia Li Yun. All rights reserved.
//

import UIKit


class RegistrationViewController: UIViewController, BEMCheckBoxDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var nameTextField : UITextField!
    @IBOutlet weak var createButton : UIButton!
    @IBOutlet weak var emailTextField : UITextField!
    @IBOutlet weak var passwordTextField : UITextField!
    @IBOutlet weak var phoneTextField : UITextField!
    @IBOutlet weak var confirmPasswordField : UITextField!
    @IBOutlet weak var TOSBox: BEMCheckBox!
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    var usernameField : String = ""
    var emailField : String = ""
    var phoneField : String = ""
    var passwordField : String = ""
    var confirmField : String = ""
    var agreeToTOS : Bool = true
    
    var regDA = registrationDA()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TOSBox.delegate = self
        view.backgroundColor = UIColor(r: 240, g: 240, b: 240)
        
        
        // Set up UI
        setupNavigationBar()
        setUpImageView()
        
        
    }
    
    
    
    
    
    // Function to create users
    @IBAction func createUser() {
        
        var userCreated = false
        
        // Put text fields value into the variables
        usernameField = nameTextField.text!
        passwordField = passwordTextField.text!
        emailField = emailTextField.text!
        phoneField = phoneTextField.text!
        confirmField = confirmPasswordField.text!
        
        
        // Check if password field matches confirm field
        if passwordField == confirmField {
            // Convert password to SHA512
            passwordField = maskPassword(passwordField).uppercased()
            confirmField = maskPassword(confirmField).uppercased()
        }
        
        
        
        
        // Check if the userfields is filled
        if checkAllFieldsRequired() == true {
            
            // Passing data to the Data Manager Function
            userCreated = registrationDA.createUser(usernameField, emailField, passwordField, phoneField, "False", "False", "E")
            
            
            // Print results
            print(userCreated)
            
            // Hash user
            if userCreated == true {
                print("User created!")
                
                //regDA.loginAndPost(emailField, "")
            }
            
            
        } // End of the if
        
        
        
    } // end of create user
    
    
    
    
    @IBAction func chooseImage(_ sender: Any) {
        
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        
        let actionSheet = UIAlertController(title: "Choose a photo source", message: "pick one", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler:  { (action: UIAlertAction) in
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler:  { (action: UIAlertAction) in
            
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:  nil ))
        
        self.present(actionSheet, animated: true, completion: nil)
        
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
        
        
        if (validFormat == false){
            let uiAlert = UIAlertController(
                title: "Required Fills",
                message: message,
                preferredStyle: UIAlertControllerStyle.alert)
            
            uiAlert.addAction(UIAlertAction(title: "Ok", style: .default,handler: nil))
            self.present(uiAlert, animated:true, completion: nil)
        }
        
        
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
    
    func setUpImageView() {
        imageView.layer.borderWidth = 1
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.clipsToBounds = true
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = image
        
        picker.dismiss(animated: true, completion: nil)
    }
    
}




extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}


