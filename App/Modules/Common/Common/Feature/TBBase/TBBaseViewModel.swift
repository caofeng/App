//
//  TBBaseViewModel.swift
//  Common
//
//  Created by Topband on 2020/3/12.
//  Copyright © 2020 拓邦→Ramon. All rights reserved.
//

import UIKit

open class TBBaseViewModel: NSObject {

    public var title = ""
    public var dataArray:[TBTableCellViewModel] = []
    public var openRefresh:Bool = false
    public var isFirstLoadData:Bool = true
    
    public override init() {
        super.init()
        dataArray.removeAll()
        commonInit()
    }
    open func commonInit() {
        
    }
    
    deinit {
        TBLog("==============\(classForCoder)============")
    }
    
}
