//
//  LLRainbowNavigationDelegate.swift
//  Pods
//
//  Created by Danis on 15/11/25.
//
//

public class RainbowNavigation: NSObject, UINavigationControllerDelegate {
    
    private weak var navigationController:UINavigationController?
    
    private var pushAnimator:RainbowPushAnimator = RainbowPushAnimator()
    private var popAnimator:RainbowPopAnimator = RainbowPopAnimator()
    private var dragPop:RainbowDragPop = RainbowDragPop()
    
    override public init() {
        super.init()
        
        dragPop.popAnimator = popAnimator
    }
    
    public func wireTo(navigationController nc : UINavigationController) {
        self.navigationController = nc
        self.dragPop.navigationController = nc
        self.navigationController?.delegate = self
    }
    
    public func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .Pop {
            return popAnimator
        }
        return pushAnimator
    }
    public func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        
        return dragPop.interacting ? dragPop : nil
    }
    
}
