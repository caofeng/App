//
//  TBTableCellViewModel.swift
//  Common
//
//  Created by Topband on 2020/3/12.
//  Copyright © 2020 拓邦→Ramon. All rights reserved.
//

import UIKit

open class TBTableCellViewModel: NSObject {

    public var height:CGFloat = 50.0
    public var separatorInsetLeft:CGFloat = UIScreen.main.bounds.size.width
    public var separatorInsetRight:CGFloat = 0
    public var sectionStyle: UITableViewCell.SelectionStyle = .default
    
    public override init() {
        super.init()
        commonInit()
    }
    
    open func commonInit() {
        
    }
    
    deinit {
        TBLog("======== \(self.classForCoder) deinit ========")
        NotificationCenter.default.removeObserver(self)
    }
}

open class TBEmptyTableCellViewModel:TBTableCellViewModel {
    
    open override func commonInit() {
        super.commonInit()
        height = kScreenHeight - kStatusAndNavBarHeight
    }
}
