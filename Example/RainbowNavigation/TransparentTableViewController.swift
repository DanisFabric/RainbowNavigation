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
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.width * 0.75))
        imageView.image = UIImage(named: "demo-header")
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
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ExampleCell", forIndexPath: indexPath)

        cell.textLabel?.text = "cell"

        return cell
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        let themeColor = UIColor.greenColor()
        
        let offsetY = scrollView.contentOffset.y
        if offsetY >= 0 {
            let height = self.tableView.tableHeaderView!.bounds.height
            let maxOffset = height - 64
            
            var progress = (scrollView.contentOffset.y - 64) / maxOffset
            progress = min(progress, 1)
            
            self.navigationController?.navigationBar.ll_setBackgroundColor(themeColor.colorWithAlphaComponent(progress))
        }
    }

}
