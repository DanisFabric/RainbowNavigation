//
//  UINavigationBar+Rainbow.swift
//  Pods
//
//  Created by Danis on 15/11/25.
//
//

import UIKit

private var kBackgroundViewKey = "kBackgroundViewKey"
private var kStatusBarMaskKey  = "kStatusBarMaskKey"
private var kTitleLabelKey = "kTitleLabelKey"
private var kBarButtonKey = "kBarButtonKey"

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
//    public func df_setBackgroundColor(_ color: UIColor) {
//        if backgroundView == nil {
//            setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//            shadowImage = UIImage()
//            backgroundView = UIView(frame: CGRect(x: 0, y: -20, width: UIScreen.main.bounds.width, height: 64))
//            backgroundView?.isUserInteractionEnabled = false
//            backgroundView?.autoresizingMask = [.flexibleHeight,.flexibleWidth]
//            insertSubview(backgroundView!, at: 0)
//        }
//        backgroundView?.backgroundColor = color
//        
//    }
    
    public func df_setBackgroundColor(_ color: UIColor,withBorder border:CGFloat = 0,withBorderColor borderColor:UIColor = UIColor(hex:"e7e7e7").alpha(0.7)) {
        if backgroundView == nil {
            setBackgroundImage(UIImage(), for: .default)
            shadowImage = UIImage()
            backgroundView = UIView(frame: CGRect(x: 0, y: -20, width: UIScreen.main.bounds.width, height: 64 - border))
            
            backgroundView?.isUserInteractionEnabled = false
            backgroundView?.autoresizingMask = [.flexibleHeight,.flexibleWidth]
            insertSubview(backgroundView!, at: 0)
        }

        
        backgroundView?.layer.borderColor = borderColor.cgColor
        backgroundView?.layer.borderWidth = border

        backgroundView?.backgroundColor = color
        
    }

    public func df_reset() {
        setBackgroundImage(nil, for: .default)
        shadowImage = nil
        
        backgroundView?.removeFromSuperview()
        backgroundView = nil
    }
    
    public func df_setTitle(title:String, withColor color:UIColor = UIColor(hex: "373737")) {
        if self.titleLabel == nil  {
            self.titleLabel = UILabel()
            if let tempBackgroundView = backgroundView {
                insertSubview(self.titleLabel!, aboveSubview: tempBackgroundView)
                self.titleLabel?.snp.makeConstraints { (make) in
                    make.centerX.equalTo(tempBackgroundView)
                    make.bottom.equalTo(-12)
                }
            }else {
                insertSubview(self.titleLabel!, at: 0)
                self.titleLabel?.snp.makeConstraints { (make) in
                    make.centerX.equalTo(self)
                    make.bottom.equalTo(-12)
                }
            }
            titleLabel?.font = UIFont(name: "PingFangSC-Regular", size: 17)
            titleLabel?.textColor = color
        }
        guard let titleLabel = self.titleLabel else{
            return
        }
        titleLabel.text = title
        
        titleLabel.isHidden = false
    }
    
    public func df_removeRightBarButton() {
        if rightBarItem != nil {
            rightBarItem?.removeFromSuperview()
        }
    }
    
    public func df_removeTitle(){
        if let titleLabel = titleLabel {
//            titleLabel.removeFromSuperview()
            titleLabel.isHidden = true
        }
    }
    
    public func df_getRightBarButton() -> UIButton {
        if rightBarItem != nil {
            rightBarItem?.removeFromSuperview()
        }
        
        rightBarItem = UIButton()
        
        if let tempBackgroundView = backgroundView {
            insertSubview(rightBarItem!, aboveSubview: tempBackgroundView)
        }else {
            insertSubview(rightBarItem!, at: 0)
        }
        
        let maxX:CGFloat = (backgroundView?.frame.maxX)!
        rightBarItem?.frame = CGRect(x: maxX-15-25, y: 7, width: 25, height: 25)
        
//        rightBarItem?.isUserInteractionEnabled = true
        return rightBarItem!
        
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
    fileprivate var titleLabel : UILabel? {
        get {
            return objc_getAssociatedObject(self, &kTitleLabelKey) as? UILabel

        }set {
            objc_setAssociatedObject(self, &kTitleLabelKey, newValue, .OBJC_ASSOCIATION_RETAIN)

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
    
    fileprivate var rightBarItem:UIButton? {
        get {
            return objc_getAssociatedObject(self, &kBarButtonKey) as? UIButton
        }
        set {
            objc_setAssociatedObject(self, &kBarButtonKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }

}
