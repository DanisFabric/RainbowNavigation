//
//  UINavigationBar+Rainbow.swift
//  Pods
//
//  Created by Danis on 15/11/25.
//
//

import Foundation

private var kBackgroundViewKey = "kBackgroundViewKey"
private var kStatusBarMaskKey  = "kStatusBarMaskKey"

extension UINavigationBar {
    
    public func df_setStatusBarMaskColor(_ color: UIColor) {
        if statusBarMask == nil {
            statusBarMask = UIView(frame: CGRect(x: 0, y: -20, width: UIScreen.main.bounds.width, height: 20))
            statusBarMask?.autoresizingMask = [.flexibleWidth,.flexibleHeight]
            if let tempBackgroundView = backgroundView {
                insertSubview(statusBarMask!, aboveSubview: tempBackgroundView)
            }else {
                insertSubview(statusBarMask!, at: 0)
            }
        }
        statusBarMask?.backgroundColor = color
    }
    public func df_setBackgroundColor(_ color: UIColor) {
        if backgroundView == nil {
            setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            shadowImage = UIImage()
            backgroundView = UIView(frame: CGRect(x: 0, y: -20, width: UIScreen.main.bounds.width, height: 64))
            backgroundView?.isUserInteractionEnabled = false
            backgroundView?.autoresizingMask = [.flexibleHeight,.flexibleWidth]
            insertSubview(backgroundView!, at: 0)
        }
        backgroundView?.backgroundColor = color
        
    }

    public func df_reset() {
        setBackgroundImage(nil, for: .default)
        shadowImage = nil
        
        backgroundView?.removeFromSuperview()
        backgroundView = nil
    }
    
    // MARK: Properties
    fileprivate var backgroundView:UIView? {
        get {
            return objc_getAssociatedObject(self, &kBackgroundViewKey) as? UIView
        }
        set {
            objc_setAssociatedObject(self, &kBackgroundViewKey, newValue, .OBJC_ASSOCIATION_RETAIN)
            
        }
    }
    fileprivate var statusBarMask:UIView? {
        get {
            return objc_getAssociatedObject(self, &kStatusBarMaskKey) as? UIView
        }
        set {
            objc_setAssociatedObject(self, &kStatusBarMaskKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
}
