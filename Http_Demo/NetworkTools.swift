//
//  NetworkTools.swift
//  Http_Demo
//
//  Created by idea on 2017/12/11.
//  Copyright © 2017年 idea. All rights reserved.
//

import UIKit
import SwiftHTTP

enum Method{
    case GET
    case POST
}
class NetworkTools {
    
    func requestData(_ type : Method, options : String, parameters : [String : Any]? = nil, token:String? = nil, finishedCallback :  @escaping (_ result : Any) -> ()) {
        let Http = type == .GET ?  HTTP.GET : HTTP.POST
        Http(GfoodsUrl+options, parameters, ["Authorization":token ?? ""] ,JSONParameterSerializer()) { response in
            if let err = response.error {
                print("请求失败：\(err.localizedDescription)")
                return
             }
            let result = response.data
//        将结果回调出去
        finishedCallback(result)
        }
    }
}
let HttpStart=NetworkTools()
