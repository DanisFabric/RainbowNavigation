//
//  TransparentTableViewController.swift
//  RainbowNavigationSample
//
//  Created by Danis on 15/12/30.
//  Copyright © 2015年 danis. All rights reserved.
//

import UIKit
import RainbowNavigation

class TransparentTableViewController: UITableViewController, RainbowColorSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.automaticallyAdjustsScrollViewInsets = false
        
        let imageView = UIImageView(image: UIImage(named: "demo-header"))
        imageView.contentMode = .ScaleAspectFill
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.width * 0.75)
        tableView.tableHeaderView = imageView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SampleCell", forIndexPath: indexPath)
        cell.textLabel?.text = "Cell"
        
        return cell
    }
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        let themeColor = UIColor(red: 247/255.0, green: 80/255.0, blue: 120/255.0, alpha: 1.0)
        
        let offsetY = scrollView.contentOffset.y
        if offsetY >= 0 {
            let height = self.tableView.tableHeaderView!.bounds.height
            let maxOffset = height - 64
            
            var progress = (scrollView.contentOffset.y - 64) / maxOffset
            progress = min(progress, 1)
            
            self.navigationController?.navigationBar.df_setBackgroundColor(themeColor.colorWithAlphaComponent(progress))
        }
    }
    
    // MARK: - RainbowColorSource
    func navigationBarInColor() -> UIColor {
        return UIColor.clearColor()
    }
}
