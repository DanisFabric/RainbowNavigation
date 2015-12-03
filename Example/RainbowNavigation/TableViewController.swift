//
//  TableViewController.swift
//  RainbowNavigation
//
//  Created by Danis on 15/11/25.
//  Copyright © 2015年 CocoaPods. All rights reserved.
//

import UIKit
import RainbowNavigation

class TableViewController: UITableViewController, LLRainbowColorSource {
    
    let navColor = UIColor(red: 201/255.0, green: 115/255.0, blue: 228/255.0, alpha: 1.0)
    
    lazy var navigationDelegate = LLRainbowNavigation()

    override func viewDidLoad() {
        super.viewDidLoad()

        if let navController = self.navigationController {
            navigationDelegate.wireTo(navigationController: navController)
        }
        navigationController?.navigationBar.ll_setBackgroundColor(navColor)
    
        navigationController?.navigationBar.ll_setStatusBarMaskColor(UIColor.blackColor().colorWithAlphaComponent(0.1))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - ColorSource
    func ll_navigationBarInColor() -> UIColor {
        return navColor
    }
    func ll_navigationBarOutColor() -> UIColor {
        return UIColor.blueColor()
    }
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellReuseID", forIndexPath: indexPath)
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Colorful"
        case 1:
            cell.textLabel?.text = "Alpha"
        default:
            cell.textLabel?.text = "Nothing"
        }
        
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            self.performSegueWithIdentifier("kSeguePushDetailColor", sender: self)
        case 1:
            self.performSegueWithIdentifier("kSeguePushDetailTransparent", sender: self)
        default:
            break
        }
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
