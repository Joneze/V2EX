//
//  homeModel.swift
//  V2EX
//
//  Created by jay on 2017/11/27.
//  Copyright © 2017年 曾辉. All rights reserved.
//


import Foundation

class homeModel {
//
//    var category: String?
//
//    var tip_new: Int?
//
//    var concern_id: String?
//
//    var web_url: String?
//
//    var icon_url: String?
//
//    var flags: Int?
//
//    var type: Int?
//
//    var name: String?
//
//    init(dict:[String :AnyObject]) {
//        concern_id = dict["concern_id"] as? String
//        category = dict["category"] as? String
//        tip_new = dict["tip_new"] as? Int
//        web_url = dict["web_url"] as? String
//        icon_url = dict["icon_url"] as? String
//        flags = dict["flags"] as? Int
//        type = dict["type"] as? Int
//        name = dict["name"] as? String
//    }
}


/// {
/// "id" : 254032,
/// "username" : "86322989",
/// "tagline" : "",
/// "avatar_mini" : "//v2ex.assets.uxengine.net/avatar/838b/31da/254032_mini.png?m=1507543878",
/// "avatar_normal" : "//v2ex.assets.uxengine.net/avatar/838b/31da/254032_normal.png?m=1507543878",
/// "avatar_large" : "//v2ex.assets.uxengine.net/avatar/838b/31da/254032_large.png?m=1507543878"
/// }

import SwiftyJSON
import BXModel
//User(eq,hash)
//id:i;username;tagline;avatar_mini;avatar_normal;avatar_large
struct User :BXModel{
    let id : Int
    let username : String
    let tagline : String
    let avatarMini : String
    let avatarNormal : String
    let avatarLarge : String
    
    init(json:JSON){
        self.id =  json["id"].intValue
        self.username =  json["username"].stringValue
        self.tagline =  json["tagline"].stringValue
        self.avatarMini =  json["avatar_mini"].stringValue
        self.avatarNormal =  json["avatar_normal"].stringValue
        self.avatarLarge =  json["avatar_large"].stringValue
    }
    
    func toDict() -> [String:Any]{
        var dict : [String:Any] = [ : ]
        dict["id"] = self.id
        dict["username"] = self.username
        dict["tagline"] = self.tagline
        dict["avatar_mini"] = self.avatarMini
        dict["avatar_normal"] = self.avatarNormal
        dict["avatar_large"] = self.avatarLarge
        return dict
    }
}

extension User: Equatable{
    static func ==(lhs:User,rhs:User) -> Bool{
        return lhs.id == rhs.id
    }
}



extension  User : Hashable{
    var hashValue:Int{ return id.hashValue   }
}

extension User : CustomStringConvertible{
    var description:String {
        var builder = "User["
        builder.append("id=\(id),")
        builder.append("username=\(username),")
        builder.append("tagline=\(tagline),")
        builder.append("avatarMini=\(avatarMini),")
        builder.append("avatarNormal=\(avatarNormal),")
        builder.append("avatarLarge=\(avatarLarge)")
        builder.append("]")
        return builder
    }
}


