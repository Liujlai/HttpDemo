//
//  CViewController.swift
//  Http_Demo
//
//  Created by idea on 2017/12/15.
//  Copyright © 2017年 idea. All rights reserved.
//
//JSON解析框架Freddy的使用Demo
import UIKit
import SwiftHTTP
import Freddy

class CViewController: UIViewController {
    var goods:[JSON]!{
        didSet{
            print(goods[0]["slogan"] ?? "no slogan")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGfoods()
    }
    //    get接口数据的解析
    func setupGfoods() {
              HTTP.GET("\(GfoodsUrl)app/index/list"){ response in
            if let err = response.error{
                print( print("请求失败：\(err.localizedDescription)"))
            }
            let datas=response.data
                do{
                    let json = try JSON(data: datas)
                    let aaa = try json.getArray(at: "data","product")
                    self.goods = aaa
                }catch{
                    print("Json 解析错误")
                }
        }
    }
}
