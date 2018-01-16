//
//  ZHSpringHeaderViewController.swift
//  V2EX
//
//  Created by jay on 2018/1/12.
//  Copyright © 2018年 曾辉. All rights reserved.
//

import UIKit

class ZHSpringHeaderViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView:UITableView!
    var dataArray = NSMutableArray()
    let cellID = "springCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        self.title = "个人中心拉伸效果"
        
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
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellID)
        cell.textLabel?.text = cellTitleArr[indexPath.row];
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
    }
    
    var cellTitleArr = ["暂定","暂定","暂定","暂定","暂定","暂定"]
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 1、设置视图背景颜色
        self.view.backgroundColor = UIColor(white: 0.25, alpha: 1.0)
        
        // 2、设置导航栏标题属性：设置标题颜色
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.black]
        // 3、设置导航栏前景色：设置item指示色
        self.navigationController?.navigationBar.tintColor = UIColor.black
        
        // 4、设置导航栏半透明
        self.navigationController?.navigationBar.isTranslucent = true
        
        // 5、设置导航栏背景图片
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        
        // 6、设置导航栏阴影图片
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    /**
     *  还原导航栏  viewWillDisAppear调用
     */
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let shadowImg = findNavLineImageViewOn(view: self.view)
        shadowImg?.isHidden = false
        self.navigationController?.navigationBar.setBackgroundImage(nil,for: .default)
        // 4、设置导航栏半透明
//        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    //寻找导航栏下的横线  （递归查询导航栏下边那条分割线）
    fileprivate func findNavLineImageViewOn(view: UIView) -> UIImageView? {
        if (view.isKind(of: UIImageView.classForCoder())  && view.bounds.size.height <= 1.0) {
            return view as? UIImageView
        }
        for subView in view.subviews {
            let imageView = findNavLineImageViewOn(view: subView)
            if imageView != nil {
                return imageView
            }
        }
        return nil
    }
    
}


