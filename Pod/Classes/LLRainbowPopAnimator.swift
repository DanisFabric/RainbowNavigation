//
//  LLRainbowPopAnimator.swift
//  Pods
//
//  Created by Danis on 15/11/25.
//
//

class LLRainbowPopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    var animating = false
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.2
    }
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        
        let fromColorSource = fromVC as? LLRainbowColorSource
        let toColorSource = toVC as? LLRainbowColorSource
        
        var nextColor:UIColor?
        nextColor = fromColorSource?.ll_navigationBarOutColor()
        nextColor = toColorSource?.ll_navigationBarInColor()
        
        let containerView = transitionContext.containerView()!
        let shadowMask = UIView(frame: containerView.bounds)
        shadowMask.backgroundColor = UIColor.blackColor()
        shadowMask.alpha = 0
        
        let finalToFrame = transitionContext.finalFrameForViewController(toVC)
        toVC.view.frame = CGRectOffset(finalToFrame, -finalToFrame.width/2, 0)
        
        containerView.insertSubview(toVC.view, belowSubview: fromVC.view)
        containerView.insertSubview(shadowMask, aboveSubview: toVC.view)
        
        let needPushBar = fromVC.navigationController?.tabBarController?.tabBar != nil && fromVC.hidesBottomBarWhenPushed && fromVC.navigationController?.viewControllers.count == 1
        let tabBar = fromVC.navigationController?.tabBarController?.tabBar
        
        if needPushBar {
            fromVC.navigationController?.tabBarController?.view.sendSubviewToBack(tabBar!)
            tabBar!.frame = CGRect(x: toVC.view.frame.minX, y: toVC.view.frame.minY, width: tabBar!.frame.width, height: tabBar!.frame.height)
        }
        
        let duration = self.transitionDuration(transitionContext)
        
        animating = true
        UIView.animateWithDuration(duration, delay: 0, options: .CurveLinear, animations: { () -> Void in
            fromVC.view.frame = CGRectOffset(fromVC.view.frame, fromVC.view.frame.width, 0)
            toVC.view.frame = finalToFrame
            shadowMask.alpha = 0
            if needPushBar {
                tabBar?.frame = CGRect(x: finalToFrame.minX, y: tabBar!.frame.minY, width: tabBar!.frame.width, height: tabBar!.frame.height)
            }
            if let navigationColor = nextColor {
                fromVC.navigationController?.navigationBar.ll_setBackgroundColor(navigationColor)
            }
            
            }) { (finished) -> Void in
                self.animating = false
                if needPushBar {
                    toVC.navigationController?.tabBarController?.view.bringSubviewToFront(tabBar!)
                }
                shadowMask.removeFromSuperview()
                
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
    }
}
