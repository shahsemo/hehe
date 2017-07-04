//
//  HomeViewController.swift
//  ShareATextbook
//
//  Created by Tan QingYu on 4/7/17.
//  Copyright © 2017 Chia Li Yun. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // HAVEN'T FIX THE CATEGORIES IMAGE
    
    var categories = [["name" : "TEXTBOOK","img": "cells"], ["name" : "TYS","img": "cells"], ["name" : "PRIMARY 1","img": "cells"], ["name" : "PRIMARY 2","img": "cells"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HomeContentTableViewCell
        
        let bookCat = categories[indexPath.row]
        
        let s = bookCat["img"]!
        cell.backgroundImage.image = UIImage(named: s)
        cell.nameLabel.text = bookCat["name"]
        
        
        
        return cell
    }
    
    
}
