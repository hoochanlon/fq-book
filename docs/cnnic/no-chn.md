## 数字证书导入

我们开始是不能打开[wiki主页 https://wikipedia.org](https://wikipedia.org)

![](https://i.postimg.cc/WbbqtFZ4/2020-04-13-114900.png)

现在，[点进入Accesser证书下载页面](https://urenko.github.io/Accesser/)，选择下载相应系统版本的程序。

![](https://i.postimg.cc/MGwBYs4W/2020-04-13-114303.png)

运行下载好的程序，接受弹窗提示的安装证书操作，选择 **`是`**

![](https://i.postimg.cc/Bb6RyBjy/old-3.png)

测试成功，该操作支持较多数被DNS污染和SNI（服务器名称指示）、RST（TCP重置攻击）的站点。

![](https://i.postimg.cc/KvtCWjjm/new2-acc.png)

证书+代理的脚本程序，将被CSP限制。这也就是用此类工具也不能访问P站的原因。有关[内容安全策略( CSP )的了解阅读](https://developer.mozilla.org/zh-CN/docs/Web/HTTP/CSP)

![](https://i.postimg.cc/Gm1mXvBd/piv.png)

## ping

可能部分读者会对下图站点、IP都能ping通，但就是访问不了网页的这一现象，而感到奇怪。

![](https://i.postimg.cc/50gC6Nkz/54.png)

ping不处于应用层http协议内，而是网络层ICMP的协议，所以，站点、IP都能ping通，但就是访问不了网页。这与TCP重置攻击有关，相关原理[请看对数字证书的相关概要说明](abc/dc_zhenshu.md)

> 图摘自 [TCP/IP、HTTP协议的区别](https://www.jianshu.com/p/f4db4eb065bd)

![](https://i.postimg.cc/50XytRx1/tcpxiyiceng.png)