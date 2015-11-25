//
//  DetailViewController.swift
//  RainbowNavigation
//
//  Created by Danis on 15/11/25.
//  Copyright © 2015年 CocoaPods. All rights reserved.
//

import UIKit
import RainbowNavigation

class DetailViewController: UIViewController, LLRainbowColorSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - ColorSource
    func ll_navigationBarInColor() -> UIColor {
        return UIColor.orangeColor()
    }
    func ll_navigationBarOutColor() -> UIColor {
        return UIColor.greenColor()
    }

}
