//
//  TBBaseTableViewCell.swift
//  Common
//
//  Created by Topband on 2020/3/12.
//  Copyright © 2020 拓邦→Ramon. All rights reserved.
//

import UIKit


open class TBBaseTableViewCell: UITableViewCell {
    
    open class func cellFor(_ tableView:UITableView)-> TBBaseTableViewCell {
        let identifier = NSStringFromClass(self.classForCoder())
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = self.init(style: .default, reuseIdentifier: identifier)
        }
        return cell as! TBBaseTableViewCell
    }
    
    required public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        setupEvents()
    }
    
    open func setupViews() {
        
    }
    
    open func setupConstraints() {
        
    }
    
    open func setupEvents() {
        
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        TBLog("=======\(classForCoder) deinit========")
    }

}

open class TBEmptyTableViewCell: TBBaseTableViewCell {
    
    fileprivate var logoImageView:UIImageView!
    fileprivate var statusLabel:UILabel!
    
    open override func setupViews() {
        
        logoImageView = UIImageView.t_imageViewWith("default_icon", nil, Common.bundle(), contentView)
        statusLabel = UILabel.t_labelWith("当前无数据", rgb(204, 204, 204), regularFont(14), .center, 1, contentView)
    }
    
    open override func setupConstraints() {
        logoImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-30)
        }
        statusLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImageView.snp.bottom).offset(20)
        }
    }
}
