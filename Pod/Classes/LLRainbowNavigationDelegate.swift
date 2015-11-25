//
//  LLRainbowNavigationDelegate.swift
//  Pods
//
//  Created by Danis on 15/11/25.
//
//

public class LLRainbowNavigationDelegate: NSObject, UINavigationControllerDelegate {
    
    private weak var navigationController:UINavigationController!
    
    private var pushAnimator:LLRainbowPushAnimator
    private var popAnimator:LLRainbowPopAnimator
    
    override public init() {
        pushAnimator = LLRainbowPushAnimator()
        popAnimator = LLRainbowPopAnimator()
        
        super.init()
    }
    
    public func wireTo(navigationController nc : UINavigationController) {
        self.navigationController = nc
        self.navigationController.delegate = self
    }
    
    public func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .Pop {
            return popAnimator
        }
        return pushAnimator
    }
    
}
