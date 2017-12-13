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
