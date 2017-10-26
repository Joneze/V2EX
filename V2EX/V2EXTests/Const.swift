//
//  Const.swift
//  V2EXTests
//
//  Created by jay on 2017/10/26.
//  Copyright © 2017年 曾辉. All rights reserved.
//

import Foundation
import UIKit


/// 屏幕的宽
let DEVICE_WIDTH = UIScreen.main.bounds.size.width
/// 屏幕的高
let DEVICE_HEIGHT = UIScreen.main.bounds.size.height

///基础域名
let BASE_IP = "https://www.v2ex.com"

let isIphoneX = DEVICE_WIDTH == 375&&DEVICE_HEIGHT == 812 ? true : false

let ZHNavibarH = isIphoneX ? 88 : 44 //导航高度

let ZHTabbarH = isIphoneX ? (49 + 34) : 49 //tabbar 高度

let ZHStatusbarH = isIphoneX ? 44 : 20 //状态栏高度

let ZHHeightGap = isIphoneX ? 122 : 64 //主要用于tableview的高度 122 是根据iPhone X 上下安全高度 64+34+24

let ZHBottomOffset = isIphoneX ? 34 : 0 //底部高度差

var UIColorFromRGB: (NSInteger) -> UIColor = {hex in
    return UIColor(red: ((CGFloat)((hex & 0xFF0000) >> 16)) / 255.0, green: ((CGFloat)((hex & 0xFF00) >> 8)) / 255.0, blue: ((CGFloat)(hex & 0xFF)) / 255.0, alpha: 1);
}

let ZHColor = UIColorFromRGB(0xec6121)


