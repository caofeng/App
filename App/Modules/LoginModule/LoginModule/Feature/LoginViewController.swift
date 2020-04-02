//
//  LoginViewController.swift
//  LoginModule
//
//  Created by Topband on 2020/3/31.
//  Copyright © 2020 深圳拓邦股份有限公司. All rights reserved.
//

import UIKit
import Common
import Alamofire

class LoginViewController: TBBaseViewController {
    
    var vm:LoginViewModel {
        get{
            return viewModel as! LoginViewModel
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func cellFor(_ tableView: UITableView, _ cellViewModel: TBTableCellViewModel, _ indexPath: IndexPath) -> TBBaseTableViewCell {
        if cellViewModel.isKind(of: LoginTableCellViewModel.classForCoder()) {
            return LoginTableCell.cellFor(tableView)
        } else if cellViewModel.isKind(of: TBEmptyTableCellViewModel.classForCoder()){
            return TBEmptyTableViewCell.cellFor(tableView)
        }
        return TBBaseTableViewCell.cellFor(tableView) 
    }
    
    override func setupCell(_ cell: TBBaseTableViewCell, _ cellViewModel: TBTableCellViewModel, _ tableView: UITableView, _ indexPath: IndexPath) {
        if cellViewModel.isKind(of: LoginTableCellViewModel.classForCoder()) {
            let cell_:LoginTableCell = cell as! LoginTableCell
            cell_.nameLabel.text = String(indexPath.row)
        } else if cellViewModel.isKind(of: TBTableCellViewModel.classForCoder()){
            cell.backgroundColor = .clear
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        showHudWithText("网络异常")
        
        
        
        
    }


    
    
}
