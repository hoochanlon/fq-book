# GitHub RST与Git SSL_ERR_SYSCALL综合分析

* 杜绝主观情绪化因素
* 多方面考虑原因（多种可能）
* 查找及建立两者关联（共同点）

主观情绪化会失去客观分析判断能力，正确率几乎忽略不计，必须杜绝主观情绪化再去分析！

### RST

网络封锁重置、hosts IP-DNS映射指向问题

### SSL_ERR_SYSCALL 

调用传输层自行设置的代理套接字，出现的无法访问的问题。可能存在代理配置或是网址有问题，网址问题则涉及到hosts映射设定内容。


### 汇总

RST与SSL_ERR_SYSCALL有一个共同的问题：hosts IP-DNS映射

应用层的Hosts通过IP-DNS映射，网址解析被指向特定IP地址。而代理只是转达客户端这特定指向访问IP请求，并不会对IP进行路径转换。若Hosts映射IP、DNS任一方不存在，则会造成即使翻墙配置了代理也无法进行访问的情况。所以代理也被称作[应用网关](https://baike.baidu.com/item/%E5%BA%94%E7%94%A8%E7%BD%91%E5%85%B3/6324513)，也是有原因的。

![](https://i.postimg.cc/SKjbkkk8/008.png)

由于Hosts比远程的DNS优先级高，主机最先进入Hosts查询DNS映射，只有在hosts中没查到该条访问映射才进行远程DNS服务器查询，VPN方面虽建立一条专用隧道进行外部服务器访问，但主机给到外部服务器解析的DNS映射还是错误的，所以还是会造成主机不可达，依旧无法访问。

![](https://i.postimg.cc/fT1p9pnn/009.png)

有时就算进行Host设定重定向也能短时间内也正常访问站点，这与keep-alive、浏览器及系统DNS缓存有关，参考 [小胡子哥-修改Hosts为何不生效，是DNS缓存？](https://www.cnblogs.com/hustskyking/p/hosts-modify.html)

#### 小插曲

对GitHub进行ping测试，发现虽然ping不通，但还是能访问。处于网络安全的考量，应该是网站禁用了ICMP回应或者开启了ICMP过滤。

参考 [kunlunmountain-为什么有些网站PING不通但又能访问.](https://www.cnblogs.com/kunlunmountain/p/5945756.html)

由此从ping转向curl测试，因为该工具也提供了很直观的信息。

![](https://i.postimg.cc/brH28KhX/010.png)
