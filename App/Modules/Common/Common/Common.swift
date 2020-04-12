//
//  Common.swift
//  Common
//
//  Created by Topband on 2020/3/31.
//  Copyright © 2020 深圳拓邦股份有限公司. All rights reserved.
//
import Foundation
import UIKit
/// 在Common模块导入第三方之后，其他模块只需再导入Common即可
import MJRefresh
import SnapKit
import FDFullscreenPopGesture
import Alamofire
import HandyJSON
import MBProgressHUD
import React

/// 基础工具模块，需要优先编译
open class Common :NSObject,UIApplicationDelegate {
        
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        TBLog("======如果模块需要，App启动时做些设置=======")
        
        return true
    }
    open class func bundle()->Bundle {
        guard let url = Bundle.main.url(forResource: "CommonBundle", withExtension: "bundle") else {
            return Bundle.main
        }
        return Bundle(url: url) ?? Bundle.main
    }
    
}
