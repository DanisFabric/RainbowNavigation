//
//  UINavigationBar+Rainbow.swift
//  Pods
//
//  Created by Danis on 15/11/25.
//
//

import Foundation

private var kRainbowAssociatedKey = "kRainbowAssociatedKey"

public class Rainbow: NSObject {
    var navigationBar: UINavigationBar
    
    init(navigationBar: UINavigationBar) {
        self.navigationBar = navigationBar
        
        super.init()
    }
    
    fileprivate var navigationView: UIView?
    fileprivate var statusBarView: UIView?
    
    public var backgroundColor: UIColor? {
        get {
            return navigationView?.backgroundColor
        }
        set {
            if navigationView == nil {
                navigationBar.setBackgroundImage(UIImage(), for: .default)
                navigationBar.shadowImage = UIImage()
                let _navigationView = UIView(frame: CGRect(x: 0, y: -UIApplication.shared.statusBarFrame.height, width: navigationBar.bounds.width, height: navigationBar.bounds.height + UIApplication.shared.statusBarFrame.height))
                _navigationView.isUserInteractionEnabled = false
                _navigationView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                _navigationView.layer.zPosition = -CGFloat.greatestFiniteMagnitude
                navigationView = _navigationView
                
                var targetContainer: UIView = navigationBar
                if #available(iOS 11, *), let c = navigationBar.subviews.first  {
                    targetContainer = c
                }
                targetContainer.insertSubview(_navigationView, at: 0)
            }
            navigationView?.backgroundColor = newValue
        }
    }
    public var statusBarColor: UIColor? {
        get {
            return statusBarView?.backgroundColor
        }
        set {
            if statusBarView == nil {
                let _statusBarView = UIView(frame: CGRect(x: 0, y: -UIApplication.shared.statusBarFrame.height, width: navigationBar.bounds.width, height: UIApplication.shared.statusBarFrame.height))
                _statusBarView.isUserInteractionEnabled = false
                _statusBarView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                _statusBarView.layer.zPosition = -CGFloat.greatestFiniteMagnitude + 1
                statusBarView = _statusBarView
                
                var targetContainer: UIView = navigationBar
                if #available(iOS 11, *), let c = navigationBar.subviews.first  {
                    targetContainer = c
                }
                if let navigationView = navigationView {
                    targetContainer.insertSubview(_statusBarView, aboveSubview: navigationView)
                } else {
                    targetContainer.insertSubview(_statusBarView, at: 0)
                }
            }
            statusBarView?.backgroundColor = newValue
        }
    }
    public func clear() {
        navigationBar.setBackgroundImage(nil, for: .default)
        navigationBar.shadowImage = nil
        
        navigationView?.removeFromSuperview()
        navigationView = nil
        
        statusBarView?.removeFromSuperview()
        statusBarView = nil
    }
}

extension UINavigationBar {
    public var rb: Rainbow {
        get {
            if let rainbow = objc_getAssociatedObject(self, &kRainbowAssociatedKey) as? Rainbow {
                return rainbow
            }
            let rainbow = Rainbow(navigationBar: self)
            objc_setAssociatedObject(self, &kRainbowAssociatedKey, rainbow, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return rainbow
        }
    }
}
