//
//  ZHDemoTableViewController.swift
//  V2EX
//
//  Created by jay on 2017/12/26.
//  Copyright © 2017年 曾辉. All rights reserved.
//

import UIKit

class ZHDemoTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView:UITableView!
    var dataArray = NSMutableArray()
    let cellID = "testCellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.title = "tabelView 合集"
        
        self.tableView = UITableView(frame:CGRect(x:0, y:0, width:DEVICE_WIDTH, height:DEVICE_HEIGHT-CGFloat(ZHBottomOffset) ), style:.grouped)
        self.tableView.register(HomeTableViewCell.classForCoder(), forCellReuseIdentifier: cellID)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedSectionHeaderHeight = 0
        self.tableView.estimatedSectionFooterHeight = 0
        self.view.addSubview(self.tableView)
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        let cell = HomeTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellID)
        cell.titleLabel.text = cellTitleArr[indexPath.row];
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return autoScaleW(150)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false) //松手后 颜色消失
        
        if indexPath.row == 0 {
            let tableViewOne = ZHSpringHeaderViewController()
            self.navigationController?.pushViewController(tableViewOne, animated: true)
            
        }
    }

    var cellTitleArr = ["下拉放大效果","暂定","暂定","暂定","暂定","暂定"]
}
