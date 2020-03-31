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

open class Common :NSObject,UIApplicationDelegate {
    
    open class func bundle()->Bundle {
        guard let url = Bundle.main.url(forResource: "CommonBundle", withExtension: "bundle") else {
            return Bundle.main
        }
        return Bundle(url: url) ?? Bundle.main
    }
    
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        print("======Common Setting=======")
        
        return true
    }
    
}
