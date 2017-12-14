//
//  BViewController.swift
//  Http_Demo
//
//  Created by idea on 2017/12/14.
//  Copyright © 2017年 idea. All rights reserved.
//

import UIKit
import MarkdownView
import SafariServices

let kscreenW = UIScreen.main.bounds.size.width
let kscreenH = UIScreen.main.bounds.size.height
let str = "# hello World!!!\n 欢迎来到:\n [Carter's1年式灰色长袖连体衣包脚爬服全棉鲸鱼男婴儿童装](http://10.10.77.0:8081/v1/) \n ![美丽花儿](http://ww2.sinaimg.cn/large/56d258bdjw1eugeubg8ujj21kw16odn6.jpg '美丽花儿')"
class BViewController: UIViewController,SFSafariViewControllerDelegate {
    let md = MarkdownView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        md.frame = CGRect(x: 0, y: 0, width: kscreenW, height: kscreenH)
        md.load(markdown: str)
        self.view.addSubview(md)
        linkHref()
        // Do any additional setup after loading the view.
    }
    func linkHref(){
        // called when user touch link
        md.onTouchLink = { [weak self] request in
        guard let url = request.url else { return false }
    
        if url.scheme == "file" {
        return false
        } else if url.scheme == "http" {
        let safari = SFSafariViewController(url: url)
//            self?.navigationController?.navigationBar.isHidden = true
            self?.present(safari, animated: true)
        return false
        } else {
        return false
        }
    }
    }
//    返回SFSafariViewController的上一界面，需要遵从SFSafariViewControllerDelegate协议
    func safariViewControllerDidFinish(_ controller: SFSafariViewController)
    {
        controller.dismiss(animated: true, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
