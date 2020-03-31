//
//  TBBaseViewController.swift
//  Common
//
//  Created by Topband on 2020/3/12.
//  Copyright © 2020 拓邦→Ramon. All rights reserved.
//

import UIKit
import MJRefresh

open class TBBaseViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    public var viewModel:TBBaseViewModel?
    var loadingView:TBLoadingView?
    fileprivate var isLoading:Bool = false
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        edgesForExtendedLayout = .all
        extendedLayoutIncludesOpaqueBars = true
//        automaticallyAdjustsScrollViewInsets = false
        view.frame = UIScreen.main.bounds
        view.backgroundColor = rgb(245, 246, 249)
        self.title = viewModel?.title

        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(0)
            make.top.equalTo(kStatusAndNavBarHeight)
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
         
        setupViews()
        setupConstrains()
        setupEvents()
         
        if viewModel?.openRefresh ?? false {
            
            loadingView = TBLoadingView(view)
            loadingView?.isHidden = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(tapClick))
            loadingView?.addGestureRecognizer(tap)
            
            let mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(refreshAction))
            tableView.mj_header = mj_header
            refreshAction()
        }
    }
    
    open func setupViews() {
           
    }
    open func setupConstrains() {
        
    }
    
    open func setupEvents() {
        
    }
    
    @objc func tapClick() {
        guard !isLoading else {
            return
        }
        refreshAction()
    }
    @objc func refreshAction() {
        
        if viewModel?.isFirstLoadData ?? false {
            loadingView?.isHidden = false
            loadingView?.normalView()
            isLoading = true
            sendNetworkRequest {[weak self] (isSuccess, message) in
                self?.endRefreshAction()
                self?.isLoading = false
                guard isSuccess else {
                    self?.loadingView?.networkError()
                    self?.showHudWithText(message ?? TBNetworkError)
                    return
                }
                self?.tableView.reloadData()
                self?.loadingView?.removeFromSuperview()
                self?.viewModel?.isFirstLoadData = false
            }
        } else {
            isLoading = true
            sendNetworkRequest {[weak self] (isSuccess, message) in
                self?.endRefreshAction()
                self?.isLoading = false
                guard isSuccess else {
                    self?.showHudWithText(message ?? TBNetworkError)
                    return
                }
                self?.tableView.reloadData()
            }
        }
    }
    open func sendNetworkRequest(complement:@escaping(_ isSuccess:Bool,_ message:String?)->Void) {
        // 子类重写
    }
    
    open func endRefreshAction() {
        tableView.mj_header?.endRefreshing()
    }
    
    open func hiddenRefreshHeader() {
        tableView.mj_header?.isHidden = true
    }
    
    // Mark -- TableViewDelegate And TableViewDataSource
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellViewModel = viewModel?.dataArray[indexPath.row]  else {
            return UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        let cell:TBBaseTableViewCell = cellFor(tableView, cellViewModel, indexPath)
        cell.selectionStyle = cellViewModel.sectionStyle
        setupCell(cell, cellViewModel, tableView, indexPath)
        return cell
    }
    
    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cellViewModel:TBTableCellViewModel = viewModel?.dataArray[indexPath.row] else {
            return 44.0
        }
        return cellViewModel.height
    }
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = viewModel?.dataArray.count else {
            return 0
        }
        return count
    }
    
    open func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cellViewModel:TBTableCellViewModel = viewModel?.dataArray[indexPath.row] else {
            return
        }
        cell.separatorInset = UIEdgeInsets(top: 0, left: cellViewModel.separatorInsetLeft, bottom: 0, right: cellViewModel.separatorInsetRight)
    }
    
    
    /// 如果需要cell ，可重写下面两个方法
    open func cellFor(_ tableView:UITableView,_ cellViewModel:TBTableCellViewModel,_ indexPath:IndexPath) -> TBBaseTableViewCell {
        //...
        return TBBaseTableViewCell()
    }
    
    open func setupCell(_ cell:TBBaseTableViewCell,_ cellViewModel:TBTableCellViewModel,_ tableView:UITableView,_ indexPath:IndexPath){
        //...
    }
    
    
    public var tableView:UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.backgroundColor = .clear
        table.separatorStyle = .singleLine
        table.cellLayoutMarginsFollowReadableWidth = false
        table.separatorColor = rgb(230,229,228)
        if #available(iOS 11.0, *) {
            table.contentInsetAdjustmentBehavior = .never
            table.estimatedRowHeight = 0;
            table.estimatedSectionHeaderHeight = 0;
            table.estimatedSectionFooterHeight = 0;
        } else {
            // Fallback on earlier versions
        }
        table.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: kBottomMargin, right: 0)
        table.tableFooterView = UIView(frame: .zero)
        return table
    }()
    
    deinit {
        TBLog("======= \(self.classForCoder) dealloc =======")
        NotificationCenter.default.removeObserver(self)
    }
    
}
