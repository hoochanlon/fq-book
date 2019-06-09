# privoxy

!>这是一个http/https协议代理工具，通过它将sock协议转换为http/https协议，以便访问互联网

打开`option`选择`edit main configuration`

<!-- ![](https://ipfs.io/ipfs/QmPcjXUUhr7AAHi3vSHVy6UfsADi1fhhb1Bt4ypYDFRaiR?3.png) -->

![](https://i.postimg.cc/yY4Rp5pz/2018-05-06-200606.png)

在配置文件中末尾处添加`forward-socks5 / 127.0.0.1:1080 .`

<!-- ![](https://ipfs.io/ipfs/QmQfecQdLwrw2xaerNosFDvrrhhdR2WvJozidVNbp1GWw5?2.png) -->

![](https://i.postimg.cc/zf6vbb91/2018-05-06-200824-1.png)

到`代理`中设置privoxy的默认地址与监听端口

<!-- ![](https://ipfs.io/ipfs/QmZ4nnJsvPqsoCeQPRvh7yiun7SiUscGPg5e2KxxFemaFC?4.png) -->

![](https://i.postimg.cc/6qw9ndcF/2018-05-06-201359.png)

测试

<!-- ![](https://ipfs.io/ipfs/QmY185S5pis1Q9rPpg6xH5UjodWT1Zr2qoRMkGj8Gpd4f1?2.png) -->

![](https://i.postimg.cc/1RHSbVJ5/2018-05-06-203158.png)

将网络共享给手机，ss共享局域网也是做了privoxy含有的端口映射功能；按照如下配置将本机环回地址改为任意地址

```
# 可以允许局域网中的连接,0.0.0.0是绑定任意地址
listen-address 0.0.0.0:8118

# 仅当前系统的软件才可以连接到Privoxy的监听端口 
# 127.0.0.1:8118
```
查看本机局域网IP地址

<!-- ![](https://ipfs.io/ipfs/QmdwEi4zS8DNWx8gzkykPAoBkocQguEEP4QYhZFQV8Kwj9?1.png) -->

![](https://i.postimg.cc/Vvsxz4Ds/2018-05-05-032400.png)

`高级`设置`代理`选择`手动`，按照如下信息设置

<!-- ![](https://ipfs.io/ipfs/Qmcw7qqe9euzZ25CX5A9epEi45wAe9hAs5zwrhaK5MkrKU?1.png) -->

![](https://i.postimg.cc/15tkTC8J/QQ20180507165544.png)

测试

<!-- ![](https://ipfs.io/ipfs/Qmb7SwSVo6VMY2og6hZeEYrTcS1KcYNxWckYYkyZifjBSS?0.png) -->

![](https://i.postimg.cc/vHcKX4KK/QQ20180507165554.png)
