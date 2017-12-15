//
//  ViewController.swift
//  Http_Demo
//
//  Created by idea on 2017/12/11.
//  Copyright © 2017年 idea. All rights reserved.
//

import UIKit
import SwiftHTTP
import SwiftyJSON

class ViewController: UIViewController {
    var product:[Product] = [Product]()
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupData()
//        setupPost()
//        setupGfoods()
//        setupToken()
//        setupTools()
//        setupGETTools()
        setupSSL()
        setupTimedOut()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension ViewController{
//    请求GET接口
    func setupData(){
        HTTP.GET("http://hangge.com"){ response in
           if let err = response.error {
                print("请求失败：\(err.localizedDescription)")
                return
            }
            print(response.description)
        }
    }
//    请求post接口
    func setupPost() {
        let param = ["ShipperCode":"JD","LogisticCode":"64587611799","OrderCode":""]
        HTTP.POST("http://139.199.169.203/ApiSearch.php", parameters: param,requestSerializer: JSONParameterSerializer()) { response in
            if let err = response.error{
                print("请求失败：\(err.localizedDescription)")
            }
            print(response.description)
        }
    }
//    get接口数据的解析
    func setupGfoods() {
        HTTP.GET("\(GfoodsUrl)app/index/list"){ response in
            if let err = response.error{
                print( print("请求失败：\(err.localizedDescription)"))
            }
            let data=response.data
            let aa = JSON(data)["data"]["product"]
            
            for i in 0..<aa.count{
                let dataP = Product(name:"\(aa[i]["name"])",slogan:"\(aa[i]["slogan"])",pic_url:"\(aa[i]["pic_url"])")
                self.product.append(dataP)
            }
            print(self.product[aa.count-1].slogan)
        }
    }
//    有token验证
    func setupToken(){
        let paras = ["opr":"search","data":["page":1,"limit":6,"cond":["id":" "]]] as [String : Any]
        HTTP.POST("\(GfoodsUrl)account/address/operation", parameters: paras, headers:["Authorization":token],requestSerializer: JSONParameterSerializer()) { response in
            if let err = response.error {
                print("请求失败：\(err.localizedDescription)")
                return
            }
            print(response.description)
        }
    }
//    提出网络请求的公共方法POST请求的使用
    func setupTools(){
        let paras =  ["cond":["title":"","message_type":2],"limit":4,"page": 1] as [String : Any]
        HttpStart.requestData(.POST, options: "app/notice/listP", parameters: paras, token: token) { (result) in
            print(result)
            print(JSON(result),"POST请求")
        }
    }
    
    
//    提出网络请求的公共方法GET请求的使用
    func setupGETTools(){
        HttpStart.requestData(.GET, options: "app/index/list") { (result) in
            let aa = JSON(result)["data"]["product"]
            print(aa,"GET请求")
        }
    }
//    设置请求超时
    func setupSSL(){
        var req = URLRequest(urlString: "https://www.google.com/")
        req?.timeoutInterval = 5
        let task = HTTP(req!)
//        var attempted = false
//        task.security = HTTPSecurity(certs: [HTTPSSLCert(data: data)], usePublicKeys: true)
        task.run { (response) in
            if let err = response.error{
                print("error:   \(err.localizedDescription)")
            }
            print("opt finished :   \(response.description)")
        }
    }
    func setupTimedOut(){
       
        var req = URLRequest(urlString: "\(GfoodsUrl)app/index/list")
        req?.timeoutInterval = 5
//        req?.httpMethod =
//        req?.appendParameters(paras)
        let task = HTTP(req!)
        task.run { (response) in
            if let err = response.error{
                print("error:   \(err.localizedDescription)")
            }
            print("opt finished :   \(response.description)")
        }
    }

}


