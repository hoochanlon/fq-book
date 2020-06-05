# 简谈杀毒软件

!> 正如前言所说，出现任何VPN、proxy相关软件就挨个演示一遍，这做不到，且真的没必要；**我只能尽量写出思路，提供读者参考，借此而探索以认知，这才是真正的重点。**

如opera这般，其他各类型软件商(不仅仅只限于杀软)为了推广附加了VPN，以此达到使用人数更多的目的，例如：panda、avast等；再比方说以“改善网络及游戏加速为目的”xx加速器为名义卖VPN的等等。

倒是像极了那句话：没有做不到，只有想不到...

![](https://i.postimg.cc/NjpHZTTV/QQ-20190612093300.jpg)

火绒做法比较精明罢了，刚入市的时候以广告推广是以提供浏览器首页的形式，而并不锁定首页；它的[营销方式](/append/guochan-sharuan?id=一些题外话-（可看可不看）)很像一加，有兴趣的话，可以在问答网站搜寻下其火热原因，这里不在过多赘述；反正，所有举动背后都是在原有市场上，自己能占有一席之地，分一杯羹；处处都一个德行，人家本来就已经占领了庞大的市场，那为什么还用你的呢？倒不如形成一股清流，让“少数极客及电脑高手”来带动大众，以此做良性的口碑推广。

## 恶意禁用连接互联网服务问题

预先禁用互联网服务是国产杀软也是企业或网吧网管的普遍手法，他们一般会以[注册表](https://baike.baidu.com/item/%E6%B3%A8%E5%86%8C%E8%A1%A8)注入代码的形式到策略组，这里给个参考链接：[bat 启用禁用浏览器代理-通过修改注册表数值](https://cuityang.iteye.com/blog/2438902)；看些官方文档以及相关博客，学习及操作注册表也是很快能入手的；说回重点，如何再改回来。

首先 `windows + r` 输入 `gpedit.msc`， 在`用户配置->管理模板->Windows组件->Internet Explorer`找到`阻止更改代理设置`，进行相关配置即可。

![](https://i.postimg.cc/fR6Ht6qD/Snipaste-2019-06-12-11-06-32.png)

若是 VPN 的话，好多时候有可能是禁用 `Remote Access Connection Manager` 与 `DHCP Client` 服务

!> 注意下方图片荧光笔标记部分的说明

`win + r -> cmd -> services.msc  -> Remote Access Connection Manager`

![](https://i.postimg.cc/XNpDqPNx/Snipaste-2019-06-30-00-22-10.png)

`win + r -> cmd -> services.msc -> DHCP Client`

![](https://i.postimg.cc/C16PJG7j/2019-06-30-002835.png)

只要客户端状态是自动获取IP地址，开启DHCP后，服务器端就会对客户端动态分配IP。如果客户端是手动配置好的IP，那么它就不会再到服务器端申请IP地址了；关闭DHCP后，客户端自动获取IP地址的请求没有服务器响应，自然无法远程分配的IP。

这也就是连上了 VPN 也上不了网的原因，连局域网（中国互联网）都连接不上，更别说进 Google 了。顺带安利两篇关于DHCP的文章：

* [扫盲：DHCP分配形式](http://server.51cto.com/sCollege-147540.htm)
* [dhcp应该开启还是关闭_dhcp关闭会怎么样](http://www.elecfans.com/baike/wangluo/luyouqi/20180307644000.html)

?> 觉得还不够的话，cmd 键入 `ipconfig /flushdns`； `netsh winsock reset` 此指令对不能打开作业系统之外的其他任何软件也有奇效 :-Oヾ(o◕∀◕)ﾉヾ！

![](https://i.postimg.cc/sXfNPbS8/Snipaste-2019-06-12-11-28-17.png)

ps：这里都是设置网络相关服务配置，说不准以后又会在哪，动些手脚呢？

![](https://i.postimg.cc/xCT9kxdj/Snipaste-2019-06-12-11-39-47.png)

还好，现在（其实早就有了）win10在设置中有比重装更可靠的还原功能！或者直接以压缩文件打开原版系统.ISO 再接着双击 `setup` 也可找到！当然，最好把国产杀软卸了吧 @_@

