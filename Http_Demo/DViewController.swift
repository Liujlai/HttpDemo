//
//  DViewController.swift
//  Http_Demo
//
//  Created by idea on 2017/12/15.
//  Copyright © 2017年 idea. All rights reserved.
//
//SnapKit的使用Demo
import UIKit
import Spring
import SnapKit

class DViewController: UIViewController {
    private var views: SpringView!
    private var btn :UIView!
    private var num:CGFloat = 400
    override func viewDidLoad() {
        super.viewDidLoad()
        btn = UIView()
        btn.backgroundColor = UIColor.cyan
        self.view.addSubview(btn)
        views = SpringView()
        views.backgroundColor = UIColor.orange
        self.view.addSubview(views)
        setupSize()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        views.y = num
        views.animation = "flash"
        views.animateToNext {
            self.views.animation = "squeezeUp"
            self.views.animateTo()
            
        }
    }
    func setupSize(){
        btn.snp.makeConstraints { (make) in
            make.width.height.equalTo(200)
            make.left.equalTo(0)
            make.top.equalTo(self.view.snp.top).offset(0)
        }
        
        views.snp.makeConstraints{(make) in
        make.width.equalTo(kscreenW)
        make.height.equalTo(200)
        make.left.equalTo(0)
        make.top.equalTo(self.btn.snp.bottom).offset(-num)
        }
    }
}
