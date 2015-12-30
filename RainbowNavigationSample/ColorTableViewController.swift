//
//  ColorTableViewController.swift
//  RainbowNavigationSample
//
//  Created by Danis on 15/12/30.
//  Copyright © 2015年 danis. All rights reserved.
//

import UIKit
import RainbowNavigation

class ColorTableViewController: UITableViewController, RainbowColorSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

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

    // MARK: - RainbowColorSource
    func navigationBarInColor() -> UIColor {
        return UIColor.redColor()
    }
}
