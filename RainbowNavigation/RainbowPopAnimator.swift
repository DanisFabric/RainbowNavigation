//
//  LLRainbowPopAnimator.swift
//  Pods
//
//  Created by Danis on 15/11/25.
//
//

class RainbowPopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    var animating = false
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.2
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        
        let fromColorSource = fromVC as? RainbowColorSource
        let toColorSource = toVC as? RainbowColorSource
        
        var nextColor:UIColor?
        nextColor = fromColorSource?.navigationBarOutColor?()
        nextColor = toColorSource?.navigationBarInColor?()
        
        let containerView = transitionContext.containerView
        let shadowMask = UIView(frame: containerView.bounds)
        shadowMask.backgroundColor = UIColor.black
        shadowMask.alpha = 0.3
        
        let finalToFrame = transitionContext.finalFrame(for: toVC)
        toVC.view.frame = finalToFrame.offsetBy(dx: -finalToFrame.width/2, dy: 0)
        
        containerView.insertSubview(toVC.view, belowSubview: fromVC.view)
        containerView.insertSubview(shadowMask, aboveSubview: toVC.view)
        
        let duration = self.transitionDuration(using: transitionContext)
        
        animating = true
        UIView.animate(withDuration: duration, delay: 0, options: .curveLinear, animations: { () -> Void in
            fromVC.view.frame = fromVC.view.frame.offsetBy(dx: fromVC.view.frame.width, dy: 0)
            toVC.view.frame = finalToFrame
            shadowMask.alpha = 0
            if let navigationColor = nextColor {
                fromVC.navigationController?.navigationBar.rb.backgroundColor = navigationColor
            }
            
            }) { (finished) -> Void in
                self.animating = false
                shadowMask.removeFromSuperview()
                
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
