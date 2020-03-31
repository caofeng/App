//
//  CommonHUD.swift
//  Common
//
//  Created by Topband on 2020/3/31.
//  Copyright © 2020 深圳拓邦股份有限公司. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD

fileprivate let HudDuration = 2.0
fileprivate var hudKey = "hudKey"
fileprivate var hudKey_ = "hudKey_"

extension UIViewController {
    
    var hud:MBProgressHUD? {
        set{
            objc_setAssociatedObject(self, &hudKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get{
            if let h = objc_getAssociatedObject(self, &hudKey) as? MBProgressHUD {
                return h
            }
            return nil
        }
    }
    
    /// 仅toast文字
    public func showHudWithText(_ text:String) {
        guard text.count > 0 else {
            return
        }
        createHud(text)
    }
    /// 仅toast菊花
    public func showHudWithLoading() {
        hiddenHud()
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.contentColor = .white;
        hud.removeFromSuperViewOnHide = true
        hud.animationType = .fade
        hud.bezelView.style = .solidColor;
        hud.bezelView.color = rgbh(0, 0, 0, 0.7);
        hud.bezelView.layer.cornerRadius = 4;
        hud.margin = 15;
        self.hud = hud
        
    }
    /// toast文字和菊花
    public func showHudTextWithLoading(_ text:String) {
        guard text.count > 0 else {
            return
        }
        hiddenHud()
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.detailsLabel.text = text
        hud.contentColor = .white;
        hud.removeFromSuperViewOnHide = true
        hud.detailsLabel.textColor = .white
        hud.animationType = .fade
        hud.detailsLabel.font = regularFont(16)
        hud.bezelView.style = .solidColor;
        hud.bezelView.color = rgbh(0, 0, 0, 0.7);
        hud.bezelView.layer.cornerRadius = 4;
        hud.margin = 15;
        self.hud = hud
    }
    /// 隐藏loading中的toast
    public func hiddenHud() {
        self.hud?.hide(animated: true)
    }
    
    func createHud(_ text:String) {
        hiddenHud()
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.mode = .text
        hud.removeFromSuperViewOnHide = true
        hud.detailsLabel.text = text
        hud.detailsLabel.textColor = .white
        hud.animationType = .fade
        hud.detailsLabel.font = regularFont(16)
        hud.bezelView.style = .solidColor;
        hud.bezelView.color = rgbh(0, 0, 0, 0.7);
        hud.bezelView.layer.cornerRadius = 4;
        hud.margin = 15;
        hud.hide(animated: true, afterDelay: HudDuration)
        self.hud = hud
    }
}

extension UIView {
    var hud:MBProgressHUD? {
        set{
            objc_setAssociatedObject(self, &hudKey_, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get{
            if let h = objc_getAssociatedObject(self, &hudKey_) as? MBProgressHUD {
                return h
            }
            return nil
        }
    }
    
    /// 仅toast文字
    public func showHudWithText(_ text:String) {
        guard text.count > 0 else {
            return
        }
        createHud(text)
    }
    /// 仅toast菊花
    public func showHudWithLoading() {
        hiddenHud()
        let hud = MBProgressHUD.showAdded(to: self, animated: true)
        hud.contentColor = .white;
        hud.removeFromSuperViewOnHide = true
        hud.animationType = .fade
        hud.bezelView.style = .solidColor;
        hud.bezelView.color = rgbh(0, 0, 0, 0.7);
        hud.bezelView.layer.cornerRadius = 4;
        hud.margin = 15;
        self.hud = hud
        
    }
    /// toast文字和菊花
    public func showHudTextWithLoading(_ text:String) {
        guard text.count > 0 else {
            return
        }
        hiddenHud()
        let hud = MBProgressHUD.showAdded(to: self, animated: true)
        hud.detailsLabel.text = text
        hud.contentColor = .white;
        hud.removeFromSuperViewOnHide = true
        hud.detailsLabel.textColor = .white
        hud.animationType = .fade
        hud.detailsLabel.font = regularFont(16)
        hud.bezelView.style = .solidColor;
        hud.bezelView.color = rgbh(0, 0, 0, 0.7);
        hud.bezelView.layer.cornerRadius = 4;
        hud.margin = 15;
        self.hud = hud
    }
    /// 隐藏loading中的toast
    public func hiddenHud() {
        self.hud?.hide(animated: true)
    }
    
    func createHud(_ text:String) {
        hiddenHud()
        let hud = MBProgressHUD.showAdded(to: self, animated: true)
        hud.mode = .text
        hud.removeFromSuperViewOnHide = true
        hud.detailsLabel.text = text
        hud.detailsLabel.textColor = .white
        hud.animationType = .fade
        hud.detailsLabel.font = regularFont(16)
        hud.bezelView.style = .solidColor;
        hud.bezelView.color = rgbh(0, 0, 0, 0.7);
        hud.bezelView.layer.cornerRadius = 4;
        hud.margin = 15;
        hud.hide(animated: true, afterDelay: HudDuration)
        self.hud = hud
    }
}
