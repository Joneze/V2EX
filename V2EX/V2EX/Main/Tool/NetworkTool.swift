//
//  NetworkTool.swift
//  V2EX
//
//  Created by jay on 2017/11/2.
//  Copyright © 2017年 曾辉. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

protocol NetworkToolProtocol {
    static func loadHomeDataFromServer (completionHandler :@escaping (_ dataFromServer : [homeModel])->())
}

class NetworkTool: NetworkToolProtocol {
    
    class func loadHomeDataFromServer ( completionHandler :@escaping (_ dataFromServer : [homeModel])->()) {
        print("调用了哦")
        
        let url = BASE_IP + "/api/topics/hot.json"
        
        Alamofire.request(url).responseJSON { (response) in
            guard response.result.isSuccess else {
                return
            }
            let home = [homeModel]()
            completionHandler(home)
            
        }
        
    }
}
