//
//  LoginViewModel.swift
//  LoginModule
//
//  Created by Topband on 2020/3/31.
//  Copyright © 2020 深圳拓邦股份有限公司. All rights reserved.
//

import UIKit
import Common

class LoginViewModel: TBBaseViewModel {

    override func commonInit() {
        title = "登录"
        
        for _ in 0...100 {
            let cellViewModel = TBTableCellViewModel()
            cellViewModel.sectionStyle = .none
            dataArray.append(cellViewModel)
            dataArray.append(LoginTableCellViewModel())
        }
        
        dataArray.append(TBEmptyTableCellViewModel())
    }
}

class LoginTableCellViewModel: TBTableCellViewModel {
    
    override func commonInit() {
        height = 60
        separatorInsetLeft = 20
        separatorInsetRight = 20
    }
}

class LoginTableCell: TBBaseTableViewCell {
    
    var nameLabel:UILabel!
    override func setupViews() {
        nameLabel = UILabel.t_labelWith("", Text_Color_51, regularFont(16), .center, 1, contentView)
    }
    
    override func setupConstraints() {
        nameLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
}
