//
//  Model.swift
//  Http_Demo
//
//  Created by idea on 2017/12/15.
//  Copyright © 2017年 idea. All rights reserved.
//

import UIKit

//let GfoodsUrl = "https://www.365greenlife.com/api/tiptop/v1/"
let GfoodsUrl = "http://10.10.51.100:10004/api/tiptop/v1/"
//token会过期
let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IjEzMzYxNjM5NzIzIiwidXNlcl9pZCI6IjEwMDAxIiwicm9sZV9uYW1lIjoiXHU2NjZlXHU5MDFhXHU3NTI4XHU2MjM3IiwiZXhwIjoxNTE1NTcwNjgyLjg3NTYwOCwiaWF0IjoxNTEyOTc4NjgyLjg3NTYwOCwidHlwZSI6IjMifQ.1sJZffVHGTuyeDuUolPJUMJwE0ciZu-YzeG4SNcPuB8"

struct Product{
    var name: String
    var slogan: String
    var pic_url: String  
}



