//
//  CustomNavigationViewController.swift
//  ntucTest
//
//  Created by Chia Li Yun on 9/5/17.
//  Copyright © 2017 Chia Li Yun. All rights reserved.
//

import UIKit

class CustomNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //  Set status bar color to white
        UIApplication.shared.statusBarStyle = .lightContent
        
        //  Set text color to white
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: colors.white]
        
        //  Set background color to red
        self.navigationBar.barTintColor = colors.red
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
