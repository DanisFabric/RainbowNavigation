//
//  LLRainbowNavigationDelegate.swift
//  Pods
//
//  Created by Danis on 15/11/25.
//
//

import Cocoa

class LLRainbowNavigationDelegate: NSObject, UINavigationControllerDelegate {
    
    @IBOutlet private weak var navigationController:UINavigationController!
    
    private var pushAnimator:LLRainbowPushAnimator
    private var popAnimator:LLRainbowPopAnimator
    
    override init() {
        super.init()
        
        pushAnimator = LLRainbowPushAnimator()
        popAnimator = LLRainbowPopAnimator()
    }
    
    func wireTo(navigationController nc : UINavigationController) {
        self.navigationController = nc
        self.navigationController.delegate = self
    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .Pop {
            return popAnimator
        }
        return pushAnimator
    }
    
}
