//
//  FirstViewController.swift
//  ntucTest
//
//  Created by Chia Li Yun on 30/4/17.
//  Copyright © 2017 Chia Li Yun. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imagePicked: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func openCameraButton(sender: AnyObject){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func openPhotoLibraryButton(sender: AnyObject){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func saveImageBtn(sender: AnyObject) {
        let imageData = UIImageJPEGRepresentation(imagePicked.image!, 0.6)
        let compressedJPGImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compressedJPGImage!, nil, nil, nil)
        
        let alert = UIAlertView(title: "Wow", message: "Your image has been saved to Photo Library", delegate: nil, cancelButtonTitle: "Okay")
        
        alert.show()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        for (key, value) in info {
            if key == UIImagePickerControllerOriginalImage {
                print(value)
                //                if value as? UIImage != nil {
                let image = value as? UIImage
                imagePicked.image = image
                self.dismiss(animated: true, completion: nil)
                //                }
                
            }
        }
    }
}

