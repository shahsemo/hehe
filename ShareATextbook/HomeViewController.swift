//
//  HomeViewController.swift
//  ShareATextbook
//
//  Created by Tan QingYu on 4/7/17.
//  Copyright © 2017 Chia Li Yun. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    
    @IBOutlet weak var sliderScrollView: UIScrollView!
    
    // HAVEN'T FIX THE CATEGORIES IMAGE
    
    var categories = [["name" : "TEXTBOOK","img": "cells"], ["name" : "TYS","img": "cells"], ["name" : "PRIMARY 1","img": "cells"], ["name" : "PRIMARY 2","img": "cells"]]
    
    let feature1 = ["title" : "Textbooks", "description" : "Check them out!", "img" : "camera"]
    let feature2 = ["title" : "TYS", "description" : "Check them out!", "img" : "camera"]
    let feature3 = ["title" : "Primary 1", "description" : "Check them out!", "img" : "camera"]
    
    
    var featureArray = [Dictionary<String, String>]()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        featureArray = [feature1, feature2, feature3]
        sliderScrollView.isPagingEnabled = true
        sliderScrollView.contentSize = CGSize(width: self.view.bounds.width * CGFloat(featureArray.count), height: 250)
        sliderScrollView.showsHorizontalScrollIndicator = false
        
        
        loadFeatures()
        
    }
    
    
    func loadFeatures() {
        for (index, feature) in featureArray.enumerated() {
            if let featureView = Bundle.main.loadNibNamed("feature", owner: self, options: nil)?.first as? FeatureView {
                featureView.titleLabel.text = feature["title"]
                featureView.descriptionLabel.text = feature["description"]
                featureView.featureImageView.image = UIImage(named: feature["img"]!)
                
                
                
                sliderScrollView.addSubview(featureView)
                featureView.frame.size.width = self.view.bounds.size.width
                featureView.frame.origin.x = CGFloat(index) * self.view.bounds.size.width
            }
        }
        
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
