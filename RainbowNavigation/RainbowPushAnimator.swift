//
//  LLRainbowPushAnimator.swift
//  Pods
//
//  Created by Danis on 15/11/25.
//
//

class RainbowPushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.3
    }
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {

        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        
        let fromColorSource = fromVC as? RainbowColorSource
        let toColorSource = toVC as? RainbowColorSource
        
        var nextColor:UIColor?
        nextColor = fromColorSource?.navigationBarOutColor?()
        nextColor = toColorSource?.navigationBarInColor?()

        let containerView = transitionContext.containerView()!
        let shadowMask = UIView(frame: containerView.bounds)
        shadowMask.backgroundColor = UIColor.blackColor()
        shadowMask.alpha = 0
        containerView.addSubview(shadowMask)
        containerView.addSubview(toVC.view)
        
        // Layout
        let originFromFrame = fromVC.view.frame
        let finalToFrame = transitionContext.finalFrameForViewController(toVC)
        toVC.view.frame = CGRectOffset(finalToFrame, finalToFrame.width, 0)
        

        let duration = transitionDuration(transitionContext)
        
        UIView.animateWithDuration(duration, delay: 0, options: .CurveEaseInOut, animations: { () -> Void in
            
            toVC.view.frame = finalToFrame
            let finalFromframe = CGRectOffset(originFromFrame, -originFromFrame.width / 2, 0)
            fromVC.view.frame = finalFromframe
            shadowMask.alpha = 0.3

            if let navigationColor = nextColor {
                fromVC.navigationController?.navigationBar.df_setBackgroundColor(navigationColor)
            }
            
            }) { (finished) -> Void in
                fromVC.view.frame = originFromFrame
                shadowMask.removeFromSuperview()
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
    }
}
