//
//  AViewController.swift
//  Http_Demo
//
//  Created by idea on 2017/12/13.
//  Copyright © 2017年 idea. All rights reserved.
//
//Spring动画
import UIKit
import Spring

class AViewController: UIViewController {
    var views: SpringView!
    var btn :UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        views = SpringView(frame: CGRect(x: 20, y: 20, width: 350, height: 350))
        views.backgroundColor = UIColor.orange
        self.view.addSubview(views)
        views.alpha = 0
        btn = UIButton(frame: CGRect(x: 20, y: 20, width: 100, height: 100))
        btn.backgroundColor = UIColor.purple
        btn.addTarget(self, action: #selector(btnTouch), for:.touchDragInside)
        self.views.addSubview(btn)
        // Do any additional setup after loading the view.
        
        //            移除动画
        //        self.dismiss(animated: false, completion: nil)
        //        ballView.force = 0.7      //弹力大小
        //        ballView.duration = 1.0  //动画持续时间
        //        ballView.delay = 0.6      //动画延时多久执行
        
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        views.animation = "swing"
        views.animate()
        views.alpha = 1
    }
    @objc func btnTouch(){
        //        views.animation = "wobble"
        //        views.animate()
        views.alpha = 1
        //        views.y = 50
        views.x = 300
        //        上面动画执行完成后，可以进行你想要的动作。
        views.animateToNext {
            self.views.animation = "fall"
            self.views.animateTo()
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
