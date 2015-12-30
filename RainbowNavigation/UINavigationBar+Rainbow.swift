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
    
    public func df_setStatusBarMaskColor(color: UIColor) {
        if statusBarMask == nil {
            statusBarMask = UIView(frame: CGRect(x: 0, y: -20, width: UIScreen.mainScreen().bounds.width, height: 20))
            statusBarMask?.autoresizingMask = [.FlexibleWidth,.FlexibleHeight]
            if let tempBackgroundView = backgroundView {
                insertSubview(statusBarMask!, aboveSubview: tempBackgroundView)
            }else {
                insertSubview(statusBarMask!, atIndex: 0)
            }
        }
        statusBarMask?.backgroundColor = color
    }
    public func df_setBackgroundColor(color: UIColor) {
        if backgroundView == nil {
            setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
            shadowImage = UIImage()
            backgroundView = UIView(frame: CGRect(x: 0, y: -20, width: UIScreen.mainScreen().bounds.width, height: 64))
            backgroundView?.userInteractionEnabled = false
            backgroundView?.autoresizingMask = [.FlexibleHeight,.FlexibleWidth]
            insertSubview(backgroundView!, atIndex: 0)
        }
        backgroundView?.backgroundColor = color
        
    }

    public func df_reset() {
        setBackgroundImage(nil, forBarMetrics: .Default)
        shadowImage = nil
        
        backgroundView?.removeFromSuperview()
        backgroundView = nil
    }
    
    // MARK: Properties
    private var backgroundView:UIView? {
        get {
            return objc_getAssociatedObject(self, &kBackgroundViewKey) as? UIView
        }
        set {
            objc_setAssociatedObject(self, &kBackgroundViewKey, newValue, .OBJC_ASSOCIATION_RETAIN)
            
        }
    }
    private var statusBarMask:UIView? {
        get {
            return objc_getAssociatedObject(self, &kStatusBarMaskKey) as? UIView
        }
        set {
            objc_setAssociatedObject(self, &kStatusBarMaskKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
}