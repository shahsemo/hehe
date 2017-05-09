//
//  CustomTabBarController.swift
//  ntucTest
//
//  Created by Chia Li Yun on 3/5/17.
//  Copyright © 2017 Chia Li Yun. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    var menuButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.setupMiddleButton()
        
        self.tabBar.barTintColor = colors.blue
        self.tabBar.tintColor = colors.white
        self.tabBar.unselectedItemTintColor = colors.lightGrey
        
//        let borderTop = CALayer()
//        borderTop.borderColor = colors.darkRed.cgColor
//        borderTop.frame = CGRect(x: 0, y: 0, width: self.tabBar.frame.width, height: 1)
////        borderTop.borderWidth = 1.8
//        borderTop.shadowColor = colors.darkGrey.cgColor
//        self.tabBar.layer.addSublayer(borderTop)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        menuButton.tintColor = colors.lightGrey
    }

    // MARK: - Setups
    func setupMiddleButton() {
        menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.tabBar.frame.height, height: self.tabBar.frame.height))
        
        var menuButtonFrame = menuButton.frame
        menuButtonFrame.origin.y = self.view.bounds.height - menuButtonFrame.height
        menuButtonFrame.origin.x = self.view.bounds.width/2 - menuButtonFrame.size.width/2
        menuButton.frame = menuButtonFrame
        
        menuButton.backgroundColor = colors.darkRed
        menuButton.layer.cornerRadius = menuButtonFrame.height/2
        
        menuButton.setImage(#imageLiteral(resourceName: "Add"), for: UIControlState())
        menuButton.contentMode = .scaleAspectFit
        menuButton.addTarget(self, action: #selector(CustomTabBarController.menuButtonAction(_:)), for: UIControlEvents.touchUpInside)
        menuButton.tintColor = colors.lightGrey
        
        self.view.addSubview(menuButton)
        
        self.view.layoutIfNeeded()
    }
    
    // MARK: - Actions
    func menuButtonAction(_ sender: UIButton) {
        self.selectedIndex = 1
        
        sender.tintColor = colors.white
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
