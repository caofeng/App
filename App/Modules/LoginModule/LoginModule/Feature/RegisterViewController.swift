//
//  RegisterViewController.swift
//  LoginModule
//
//  Created by Topband on 2020/4/3.
//  Copyright © 2020 深圳拓邦股份有限公司. All rights reserved.
//

import UIKit
import React

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios")
        let mockData:NSDictionary = ["scores":
            [
                ["name":"Alex", "value":"42"],
                ["name":"Joel", "value":"10"]
            ]
        ]

        let rootView = RCTRootView(
            bundleURL: jsCodeLocation!,
            moduleName: "RNHighScores",
            initialProperties: mockData as [NSObject : AnyObject],
            launchOptions: nil
        )
        view = rootView
    }
    

}
