## Ajax基本操作

```javascript
// server.js, 通过node server.js启动服务端
// 1. 引入express
const express = require('express')

// 2. 创建express对象
const app = express();

// 3. 创建路由规则
// request是对请求报文的封装
// response是对响应报文的封装
app.get('/', (request, response) => {
    response.send('Hello, Express!');
});

app.get('/server', (request, response) => {
    // 设置响应头，设置允许跨域
    response.setHeader('Access-Control-Allow-Origin', '*');
    // 设置响应体
    response.send('Hello, Ajax!');
});

app.listen(8000, () => {
    console.log("服务已经启动, 8000端口监听中...")
})
```



get.html, 通过点击按钮返回ajax的响应体并显示

```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajax get 请求</title>
    <style>
        #result{
            width: 200px;
            height: 100px;
            border: solid 1px #90b;
        }
    </style>
</head>
<body>
    <button>点击发送请求</button>
    <div id="result">

    </div>

    <script>
        // 获取button于是怒
        const btn = document.getElementsByTagName('button')[0];
        const result = document.getElementById('result')
        // 绑定事件
        btn.onclick = function() {
            // 1. 创建对象
            const xhr = new XMLHttpRequest()
            // 2. 初始化， 设置请求的方法和url
            xhr.open('GET', 'http://127.0.0.1:8000/server')
            // 3. 发送
            xhr.send()
            //4. 事件绑定, 处理服务端返回的结果
            // readystate是xhr中的一个属性， 表示状态0 1 2 3 4 
            // 0 初始化 1 open 2 send 3 服务端返回部分结果 4 服务端返回所有结果
            xhr.onreadystatechange = function() {
                // 判断服务端返回了所有结果
                if (xhr.readyState ===  4) {
                    // 判断相应状态码
                    if (xhr.status >= 200 && xhr.status < 300) {
                        // 处理服务端相应的结果
                        // 行 头 空行 体
                        // 1. 响应行
                        // console.log(xhr.status)
                        // console.log(xhr.statusText)
                        // console.log(xhr.getAllResponseHeaders())
                        // console.log(xhr.response)
                        // 设置result的文本
                        result.innerHTML = xhr.reso
                    }
                }
            }
        }
    </script>
</body>
</html>
```

post.html

```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>post</title>
    <style>
        #result{
            width: 200px;
            height: 100px;
            border: solid 1px #903;
        }
    </style>
</head>
<body>
    <div id="result">

    </div>
    <script>
        const result = document.getElementById('result')
        result.addEventListener('mouseover', function() {
            // console.log('test...')
            const xhr = new XMLHttpRequest()
            xhr.open('POST', 'http://127.0.0.1:8000/server')
            xhr.send('a=100&&b=200&&c=300')
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4) {
                    if (xhr.status >= 200 && xhr.status < 300) {
                        result.innerHTML = xhr.response
                    }
                }
            }
        })
    </script>
</body>
</html>
```

nodemon **.js 可以在保存js代码后自动重启(相比于node *.js)
