# SS/SSR


!>  简单来说代理与VPN的最大区别就在于代理不会虚拟一块独立的网卡<br>
  多数免费代理与VPN是严格[NAT类型](/abc/4nat.md)，以限制游戏与下载等操作<br>
 ssr可以使用ss链接与二维码，反之是不行的，且ss只能连接兼容ss的服务器<br>
 若想较为深入的了解ss链接的含义，[请参考ss、ssr、v2ray链接解析章节](/append/srvurl.md)<br>
 ss与ssr都做了socks代理端口对http协议的兼容，所以并不需要额外的代理转发<br>
 全局模式即被的代理软件所有网络均走代理路线，直连模式即正常访问不走任何代理<br><br>


## SS

?> 在直接关机而没先将代理关闭的情况下，计算机再次启动时，设置在系统中代理配置还是生效的，这也就是用过代理软件后，却无法上网的原因

### 入门

访问[ss站点](https://free-ss.tk/)，右键扫描二维码

<!-- ![](https://ipfs.io/ipfs/QmWS9eJJi7dnMXjG7jxYAz7NDDCLHnrtSfc6viNRjbBjc9?2.png) -->

![](https://i.postimg.cc/C1v3LX5P/2018-04-30-105508.png)

 此时已经可以连接互联网了，如果你的系统不是自动设置的，请看<a href="#/proxy/ss-ssr?id=配置">配置</a>

右键允许来自局域网的连接

<!-- ![](https://ipfs.io/ipfs/QmbNUAL9vmXcnAkWP15XxevvLqpED2tbAxxnVCeGDs3o9X?1.png) -->

![](https://i.postimg.cc/J0fdsLLq/2018-05-05-032022.png)

`网络和共享中心`-&gt;`wlan`-&gt;`详细信息`查看本机网卡IP地址

<!-- ![](https://ipfs.io/ipfs/QmdwEi4zS8DNWx8gzkykPAoBkocQguEEP4QYhZFQV8Kwj9?4.png) -->

![](https://i.postimg.cc/Vvsxz4Ds/2018-05-05-032400.png)

`高级`设置`代理`选择`手动`，按照如下信息设置

<!-- ![](https://ipfs.io/ipfs/QmfU5EVwSUgyNtKFbetxfR1pvcyQTgbmM1y5Rp7QYkuX1b?1.png) -->

![](https://i.postimg.cc/mkCKNDVq/x1.png)

 一些朋友可能对连接互联网的网速要求较高，也可使用[speedtest](http://www.speedtest.net/)进行测试

<!-- ![](https://ipfs.io/ipfs/QmRfQ2LhCek5jw7UDBxwC2Y9Qm8VLjP17Ehhgh99Kw7Uod?3.png) -->

![](https://i.postimg.cc/zXw9yyyH/x2.png)

### 配置

有些系统如win7，连接服务器后还需在internet属性中手动设置本机地址与sock5代理端口

<!-- ![](https://ipfs.io/ipfs/QmQBdt4QM9GKcgfFdXh1LtKh45ubyrTqhjEgVHUBk9VfG4?4.png) -->

![](https://i.postimg.cc/k4tHqGr4/2018-04-28-224352.png)

PAC模式即脚本配置模式，收录的网址走代理路线，没有收录的地址则不走代理路线即正常访问。例如将Google加入代理访问列表，配置规则如下：

```text
 ".google.com",
"||google.com",
```

在`pac`选项中-&gt;`编辑本地pac文件`即可

<!-- ![](https://ipfs.io/ipfs/QmeHE8dTsEEQhvQRWBjwzKeioyprepRha6vFFYpce4i22o?1.png) -->

![](https://i.postimg.cc/xTP40BZK/2018-04-28-230423.png)

### SS分享

右键-&gt;`服务器`-&gt;`分享服务器配置`，如图

![](https://i.postimg.cc/bv46CPGj/2018-53px8.png)

随后可以看到相关ss链接与二维码生成

![](https://i.postimg.cc/90hL2Bt8/2018-06-09-174922.png)

可将二维码截图或是复制ss链接分享给他人，扫码或粘贴导入都行

![](https://i.postimg.cc/FFyPZ2N2/2018-06-09-181034.png)

## SSR

### 订阅功能

右键->`服务器订阅`->`SSR服务器订阅设置`
<!-- ![](https://ipfs.io/ipfs/QmX4z2VDbj5EDvzRzBHTiyqYsTvvxbgDi3pFwhiLfLLNFL?1.png) -->

![](https://i.postimg.cc/wvKV5kPq/2018-04-28-235146.png)

点击add添加按钮，并导入此条订阅：https://prom-php.herokuapp.com/cloudfra_ssr.txt
<!-- ![](https://ipfs.io/ipfs/QmNbaKnwt9E447xLzndAZvCHDByMbA6rZn4AsdDbeuFDuP?2.png) -->

![](https://i.postimg.cc/YChfJVB2/2018-06-09-215048.png)

<!-- ![](https://ipfs.io/ipfs/QmfXCT9yWSxPq4G7QuU9b1RzmFWZodAkY2Pzrt7iGHko5X?1.png) -->

再右键->`服务器订阅`->`更新ssr服务器订阅（不通过代理）`

![](https://i.postimg.cc/jSpNBShv/2018-04-28-235337.png)

订阅成功后会有如下提示
<!-- ![](https://ipfs.io/ipfs/QmdteWfXcW3NzJrB8gbxmF83eoybYfBoLThFEC6f8CwYCw?1.png) -->

![](https://i.postimg.cc/SQ1nwKS8/2018-04-28-235358.png)

再打开SSR可看到导入了多条账号信息

![](https://i.postimg.cc/TPcwQdNK/2018-06-09-220222.png)


订阅的好处：

* 一键导入多条服务器地址
* 不需要经常打开站点网址即可更新服务器配置（取决于订阅源）

### SSR分享

打开ssr选中ssr链接即可

![](https://i.postimg.cc/SNzx37tF/2018-06-09-190728.png)



<!-- !> ssr可以使用ss链接与二维码，反之是不行的，且ss只能连接兼容ss的服务器<br>
 若想较为深入的了解ss链接的含义，[请参考ss、ssr、v2ray链接解析章节](/append/srvurl.md)<br>
 ss与ssr都做了socks代理端口对http协议的兼容，所以并不需要额外的代理转发<br>
 全局模式即被的代理软件所有网络均走代理路线，直连模式即正常访问不走任何代理 -->
<!-- ps:

* ssr可以使用ss链接与二维码，反之是不行的，且ss只能连接兼容ss的服务器
* ss与ssr都做了socks代理端口对http协议的兼容，所以并不需要额外的代理转发
* 全局模式即被的代理软件所有网络均走代理路线，直连模式即正常访问不走任何代理 -->
