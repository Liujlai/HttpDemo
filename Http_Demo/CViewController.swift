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
          HTTP.GET("https://www.google.com/"){ response in
            if let err = response.error{
                log.error("请求失败: \(err.localizedDescription)")
            }
            let datas=response.data
                do{
                    let json = try JSON(data: datas)
                    let aaa = try json.getArray(at: "data","produict")
                    self.goods = aaa
                }catch {
                    log.error("Json 解析错误: \(error)")
                    // Now let’s log!
                    log.verbose("not so important")  // prio 1, VERBOSE in silver
                    log.debug("something to debug")  // prio 2, DEBUG in green
                    log.info("a nice information")   // prio 3, INFO in blue
                    log.warning("oh no, that won’t be good")  // prio 4, WARNING in yellow
                    log.error("ouch, an error did occur!")  // prio 5, ERROR in red
                }
        }
    }

}
