//
//  LLRainbowDragPop.swift
//  Pods
//
//  Created by Danis on 15/11/25.
//
//

class RainbowDragPop: UIPercentDrivenInteractiveTransition {
    
    var interacting = false
    weak var navigationController:UINavigationController! {
        didSet {
            let panGesture = UIPanGestureRecognizer(target: self, action: "handlePan:")
            
            navigationController?.view.addGestureRecognizer(panGesture)
        }
    }
    weak var popAnimator:RainbowPopAnimator!
    
    override var completionSpeed: CGFloat {
        get {
            return max(CGFloat(0.5), 1 - self.percentComplete)
        } set {
            self.completionSpeed = newValue
        }
    }
    
    
    func handlePan(panGesture:UIPanGestureRecognizer) {
        let offset = panGesture.translationInView(panGesture.view)
        let velocity = panGesture.velocityInView(panGesture.view)
        
        switch panGesture.state {
        case .Began:
            if !self.popAnimator.animating {
                interacting = true
                if velocity.x > 0 && self.navigationController.viewControllers.count > 0 {
                    navigationController.popViewControllerAnimated(true)
                }
            }
        case .Changed:
            if interacting {
                var progress = offset.x / panGesture.view!.bounds.width
                progress = max(progress,0)
                
                self.updateInteractiveTransition(progress)
            }
        case .Ended:
            if interacting {
                if panGesture.velocityInView(panGesture.view!).x > 0 {
                    self.finishInteractiveTransition()
                }else {
                    self.cancelInteractiveTransition()
                }
                interacting = false
            }
        case .Cancelled:
            if interacting {
                self.cancelInteractiveTransition()
                interacting = false
            }
        default:
            break
        }
    }
    
}