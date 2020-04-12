//
//  AppDelegate.swift
//  App
//
//  Created by Topband on 2020/3/31.
//  Copyright © 2020 深圳拓邦股份有限公司. All rights reserved.
//

import UIKit
import Common
import LoginModule

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
                        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        let nav = UINavigationController(rootViewController: vc!)
        window?.rootViewController = nav
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        
    }
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }
    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }    
    
    func applicationWillTerminate(_ application: UIApplication) {
        
    }
    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        
    }


}

