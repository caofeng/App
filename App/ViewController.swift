//
//  ViewController.swift
//  App
//
//  Created by Topband on 2020/3/31.
//  Copyright © 2020 深圳拓邦股份有限公司. All rights reserved.
//

import UIKit
import LoginModule

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "首页"
        
        
        
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let vc = LoginModule.loginPage()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    

}

