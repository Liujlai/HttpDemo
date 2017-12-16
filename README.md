# HttpDemo
> 'SwiftHTTP'与 'SwiftyJSON'的Demo，对SwiftHTTP有简单封装

```    
//POST请求的使用
    func setupTools(){
        let paras = ["opr":"search","data":["page":1,"limit":6,"cond":["id":" "]]] as [String : Any]
        HttpStart.requestData(.POST, options: "account/address/operation", parameters: paras, token: token) { (result) in
            print(JSON(result),"POST请求")
        }
    }
//GET请求的使用
    func setupGETTools(){
        HttpStart.requestData(.GET, options: "app/index/list") { (result) in
            let aa = JSON(result)["data"]["product"]
            print(aa,"GET请求")
        }
    }
```
> 富文本的显示和点击富文本href后跳转SFSafariViewController

```    
//富文本的显示
  let md = MarkdownView()
    override func viewDidLoad() {
        super.viewDidLoad()
        md.frame = CGRect(x: 0, y: 0, width: kscreenW, height: kscreenH)
        md.load(markdown: str)
        self.view.addSubview(md)
    }
//    返回SFSafariViewController的上一界面，需要遵从SFSafariViewControllerDelegate协议
    func safariViewControllerDidFinish(_ controller: SFSafariViewController)
    {
        controller.dismiss(animated: true, completion: nil)
    }
```

> JSON解析框架Freddy解析SwiftHTTP返回数据的使用Demo

```    
//Freddy解析SwiftHTTP返回数据
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
```

> SnapKit与Spring的使用Demo

```    
//点击开始动画
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        views.y = num
        views.animation = "flash"
        views.animateToNext {
            self.views.animation = "squeezeUp"
            self.views.animateTo()   
        }
    }
    //SnapKit布局
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
  
```
