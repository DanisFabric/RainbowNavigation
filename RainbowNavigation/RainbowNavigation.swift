//
//  LLRainbowNavigationDelegate.swift
//  Pods
//
//  Created by Danis on 15/11/25.
//
//

public class LLRainbowNavigation: NSObject, UINavigationControllerDelegate {
    
    private weak var navigationController:UINavigationController!
    
    private var pushAnimator:RainbowPushAnimator
    private var popAnimator:RainbowPopAnimator
    private var dragPop:RainbowDragPop
    
    override public init() {
        pushAnimator = RainbowPushAnimator()
        popAnimator = RainbowPopAnimator()
        dragPop = RainbowDragPop()
        dragPop.popAnimator = popAnimator

        super.init()
    }
    
    public func wireTo(navigationController nc : UINavigationController) {
        self.navigationController = nc
        self.dragPop.navigationController = nc
        self.navigationController.delegate = self
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
