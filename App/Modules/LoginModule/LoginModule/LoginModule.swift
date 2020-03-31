//
//  LoginModule.swift
//  LoginModule
//
//  Created by Topband on 2020/3/31.
//  Copyright © 2020 深圳拓邦股份有限公司. All rights reserved.
//
import Foundation
import UIKit

/// 每个模块open一个对外类，方便交互
open class LoginModule :NSObject, UIApplicationDelegate {
    
    open class func loginPage() -> UIViewController {
        let vm = LoginViewModel()
        let vc = LoginViewController()
        vc.viewModel = vm
        return vc
    }
    
    
    /// 如果此模块需要在 appDelegate 里做设置，可实现UIApplicationDelegate代理方法
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        print("LoginMoudle didLaunch")
        
        return true
    }

}
