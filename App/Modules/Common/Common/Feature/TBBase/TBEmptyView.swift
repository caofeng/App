//
//  TBEmptyView.swift
//  Common
//
//  Created by Topband on 2020/3/12.
//  Copyright © 2020 拓邦→Ramon. All rights reserved.
//

import UIKit
import SnapKit

class TBLoadingView: UIView {

    fileprivate var descLabel:UILabel!
    fileprivate var activityView:UIActivityIndicatorView!
    fileprivate var networkErrorImageView:UIImageView!
    
    convenience init(_ superView:UIView) {
        self.init()
        backgroundColor = rgb(255, 255, 255)
        superView.addSubview(self)
        superView.bringSubviewToFront(self)
        snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(kStatusAndNavBarHeight)
        }
        
        descLabel = UILabel.t_labelWith("拼命加载中...", rgb(100, 100, 100), regularFont(16), .center, 1, self)
        activityView = UIActivityIndicatorView(style: .gray)
        activityView.hidesWhenStopped = true
        addSubview(activityView)
        
        networkErrorImageView = UIImageView.t_imageViewWith("default_icon", nil,Common.bundle(), self)

        normalView()
    }
    
    func normalView() {
        
        activityView.startAnimating()
        descLabel.text = "拼命加载中..."
        networkErrorImageView?.isHidden = true
        activityView.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(descLabel.snp.left).offset(-3)
        }
        descLabel.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview().offset(10)
        }
    }
    
    func networkError() {
        descLabel.text = "网络异常，点击重试"
        networkErrorImageView.isHidden = false
        activityView.stopAnimating()
        networkErrorImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-30)
        }
        descLabel.snp.remakeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(networkErrorImageView.snp.bottom).offset(10)
        }
    }
    
    deinit {
        TBLog("======== \(self.classForCoder) dealloc =======")
    }
    
}
