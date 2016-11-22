//
//  MainTableViewController.swift
//  RainbowNavigationSample
//
//  Created by Danis on 15/12/30.
//  Copyright © 2015年 danis. All rights reserved.
//

import UIKit
import RainbowNavigation

class MainTableViewController: UITableViewController, RainbowColorSource {

    lazy var rainbowNavigation = RainbowNavigation()
    let navColor = UIColor(red: 201/255.0, green: 115/255.0, blue: 228/255.0, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.df_setBackgroundColor(navColor)
        self.navigationController?.navigationBar.df_setStatusBarMaskColor(UIColor(white: 0, alpha: 0.2))
        
        if let navigationController = navigationController {
            rainbowNavigation.wireTo(navigationController: navigationController)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SampleCell", for: indexPath)

        switch (indexPath as NSIndexPath).row {
        case 0:
            cell.textLabel?.text = "Color"
        case 1:
            cell.textLabel?.text = "Transparent"
        default:
            break
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath as NSIndexPath).row {
        case 0:
            performSegue(withIdentifier: "PushColorVC", sender: self)
        case 1:
            performSegue(withIdentifier: "PushTransparentVC", sender: self)
        default:
            break
        }
    }

    // MARK: - RainbowColorSource
    func navigationBarInColor() -> UIColor {
        return navColor
    }
}
