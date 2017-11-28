//
//  HomeTableViewCell.swift
//  V2EX
//
//  Created by jay on 2017/10/26.
//  Copyright © 2017年 曾辉. All rights reserved.
//

import UIKit


class HomeTableViewCell: UITableViewCell {
    
    let intX = autoScaleW(20)
    
    
    lazy var titleLabel : UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: autoScaleW(28))
        label.textColor = UIColorFromRGB(0x454545)
        label.text = "看看效果吧"
        return label
    }()
    
    lazy var iconImage : UIImageView = {
        var image = UIImageView()
        image.backgroundColor = UIColor.red
        return image
    }()
    
    required init?(coder aDecoder:NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupUI()
    }
    
    func setupUI()  {
        
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.iconImage)
        self.setFrame()
        
    }
    
    func setFrame() {
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(intX)
            make.top.equalTo(self.contentView).offset(intX)
        }
        
        self.iconImage.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(intX)
            make.top.equalTo(self.titleLabel.snp.bottom).offset(intX)
            make.size.equalTo(CGSize(width: autoScaleW(30), height: autoScaleW(30)))
        }
    }
    
}
