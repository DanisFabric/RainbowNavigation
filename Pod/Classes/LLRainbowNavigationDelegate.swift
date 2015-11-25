//
//  LLRainbowNavigationDelegate.swift
//  Pods
//
//  Created by Danis on 15/11/25.
//
//

class LLRainbowNavigationDelegate: NSObject, UINavigationControllerDelegate {
    
    @IBOutlet private weak var navigationController:UINavigationController!
    
    private var pushAnimator:LLRainbowPushAnimator
    private var popAnimator:LLRainbowPopAnimator
    
    override init() {
        pushAnimator = LLRainbowPushAnimator()
        popAnimator = LLRainbowPopAnimator()
        
        super.init()
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
