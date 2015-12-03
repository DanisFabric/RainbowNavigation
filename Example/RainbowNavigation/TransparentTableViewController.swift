//
//  TranparentTableViewController.swift
//  RainbowNavigation
//
//  Created by Danis on 15/12/3.
//  Copyright © 2015年 CocoaPods. All rights reserved.
//

import UIKit
import RainbowNavigation

class TransparentTableViewController: UITableViewController, LLRainbowColorSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.automaticallyAdjustsScrollViewInsets = false
        let imageView = UIImageView(image: UIImage(named: "demo-header"))
        imageView.contentMode = .ScaleAspectFill
        imageView.clipsToBounds = true
        self.tableView.tableHeaderView = imageView
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - LLRainbowColorSource
    func ll_navigationBarInColor() -> UIColor {
        return UIColor.clearColor()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    

}
