# 深网和暗网的区别及基础扫盲

> 原文：[深网和暗网的区别及基础扫盲](http://chitanda.me/2016/08/19/difference-between-deepweb-and-darkweb/) 作者：[Chitanda Akari](http://chitanda.me/2016/08/19/difference-between-deepweb-and-darkweb/)

## 什么是深网

根据[维基百科相关词条](https://zh.wikipedia.org/wiki/%E6%B7%B1%E7%BD%91)的解释:  


| 深网（英语：Deep Web、Dark Web，又称：不可见网、隐藏网）<br>是指互联网上那些不能被标准搜索引擎索引的非表面网络内容。 |
| --- |


可以看出这**深网**并不仅仅是指网络站点，它的范围远大于一般的网站，它包括所有不能被搜索引擎抓取到的网络内容，比如：你的QQ聊天记录，你微博私信记录，MC私服，诸如SSH、VPN等非标准80或443端口且不走标准HTTP/HTTPS协议的内容等等。因此对于普通用户来说他们每时每刻都在和深网打交道，所谓”深网深不可测”自然是个笑话。而且实际上深网这个概念对用户来说毫无意义，因为不同用户”能抓取到的内容不同”，A的聊天记录被B来说就是”深网”；你女神对你屏蔽的朋友圈对你来说也是”深网”，而对她自己来说自然就是个普通的表层网络。所以讨论”深网”的时候只能取绝对参照物——搜索引擎，**深网其实是一个仅针对搜索引擎的概念，表示不能被其抓取到的私有内容**

## 什么是暗网

暗网是深网的子集，根据维基上的解释：暗网（英语：Darknet或Dark Web）是指只使用非常规协议和端口以及可信节点进行连接的私有网络,暗网是不能通过”常规方式”访问的——当然你用TOR浏览器就不算常规方式了。而根据wiki还有别的方式比如Freenet、RetroShare、GNUnet、OneSwarm、Tribler等等就不一一列举了。

对普通大众来说最简单的方法还是Tor浏览器，暗网的重点在于”暗”。属于网络上的黑市，这里面有很多暴力，色情，黑产等相关的东西，比如军火、假护照、信用卡、用户信息、0day等等。网络上大部分阴谋论相关的文章也都是从暗网这些阴暗点做切入点进行发散创作。

## 谣言

由于进入暗网需要的一点点技术门槛（国外是TOR国内是VPN+TOR）导致很多文章都开始搞阴谋论和超自然分析夺人眼球。这里选几个比较经典的做下解释

## 暗网和深网是同一个东西

这个是最常见的，往往标题里写着”深网”结果写着写着就成了”暗网”。比如这两篇，就是典型的误导人：  

* 《[一篇关于 DEEP WEB 的简易指南](http://www.vice.cn/read/a-brief-guide-to-deep-web)》
* 《[暗网，一个比你想象中恐怖100倍的互联网世界](http://www.admin5.com/article/20151004/625784.shtml)》

前面也说过，暗网是深网的子集，但深网里的绝大多数网站都是普通用户可以直接接触到的内容；和暗网这种必须借助第三方工具才能访问的不一样。

## 暗网的内容占了互联网全部内容的96%

这个是上面那个谣言的变种。其实也是”深网””暗网”弄混了而已。这句话原话出自[纸牌屋](http://www.slate.com/articles/technology/bitwise/2014/02/house_of_cards_season_2_what_s_up_with_all_the_deep_web_stuff.html)：”Deep Web is 96 percent of the Internet, with us plebes only seeing a mere 4 percent.”,可见原文说的是”深网的内容占了互联网内容的4%”而不是”暗网”。

事实上这个谣言本身也是相当好反驳的：

1. 因为暗网本身的用户量就是相当少，可能只占网民的x万分之一，这种比例下他们的内容产出不可能超越作为大多数的普通网民所构建的普通网络

2. Apple、Google、Facebook、Amazon等公司每年在硬件和带宽上的成本至少加起来上百亿人民币，如果暗网本身内容是表层网络的几十倍的话，那他们的成本就更可怕了。然而全部暗网的流水加起来估计都覆盖不了这里的零头。而如果是深网的话这句话是没有多少问题的，这里先不论4%这个数字是否准确（因为按照有些人的计算google收录的不只4%，然而这点不好证伪，所以姑且认为是4%吧）。因为互联网大部分用户数据对搜索引擎而言都是不公开的。

## 暗网是非公开的，一般人很难进去

这个其实是很难证伪的论点，因为有个”没有真正的苏格兰人”的诡辩点在：你举出的例子对方都可以用”这不是真正的暗网”来死缠烂打，所以具体不深入。  

单纯说下”非公开”这点：这是个认知错误。其实暗网依旧是公开站点，它只是与普通的公网相隔绝而已。真正的非公开站点应该是那些纯局域网内的站点。而”普通人很难接触这点”，由于通过TOR浏览器就可以直接访问了，因此也是故意夸大难度好渲染阴谋论而已。网上很多帖子只说自己看到的各种光怪陆离的东西而从来不给链接可能也就是因为给了后大概立马就要被打脸了。

事实上访问**暗网真正的难点其实在于获取URL**,因为很多网站都是过几天就换一个域名。对于大众来说只能依靠**hidden wiki**的帮助，而真正的暗网深度人士大概会有其他的获取渠道，比如IRC聊天室，专门的发布页面等等。（这个只是个人猜测而已）

## 暗网上有相当多的血腥恐怖的内容 

这个本质上其实不能算谣言。但我拿出来就是因为**这部分内容被媒体过于渲染，把少数当多数**，这个说法的问题在于**相当多**，虽然暗网上确实有部分血腥暴力的站点，但是就和表站里也有很多小众站点如食人，撒旦教等等一样，这部分站点在暗网里也只是占了极少数。从暗网的大部分**hidden wiki**页面来看，暗网的主流内容还是各种交易市场：比特币、毒品、枪支、信用卡等等；再就是色情站点等，买凶相关的站点也有，但是非常血腥主题的确实基本上看不到（有些人大概会认为这说明他们藏的更深，找不到不代表就没有。但是这也从侧面证明了它们的小众，由这种极小部分人群作为暗网代表，我觉得相当缺乏说服力） 

而根据wiki上[Dark web](https://en.wikipedia.org/wiki/Dark_web)里的相关数据表明，暗网站点里数量前三的是”Drugs”、”Market”、”Fraud”,即药品、交易、欺诈前三，可以说明那些极度血腥反人类的真的只是极少

<!-- ![](https://ipfs.io/ipfs/Qmd2gda91yrCpzfNMu8LKEjPaV8WcBpa7SXSH5iM5Tp9rx?2.jpg) -->

![](https://i.postimg.cc/c6qJwb1d/hidden-web-category.png)

## 总结

首先是需要TOR打开[The Uncensored Hidden Wiki](http://uhwiki36pbooodfj.onion/wiki/index.php/Main_Page)，另外这种导航页其实有很多，各位可以自行挖掘

<!-- ![](https://ipfs.io/ipfs/QmaX8fmm2pBGNRQ9WU3xuPDdiB4wtyGd18oPpZ16mu3Bxc?0.jpg) -->

![](https://i.postimg.cc/1373KX3W/hiddenwiki.jpg)

<!-- ![](https://ipfs.io/ipfs/QmRzrEfCk1Rxo6opZbidCyNnStFBhhzmszsbq517NC3E1K?0.jpg) -->

![](https://i.postimg.cc/RZ2zFHFz/hiddenwiki-list.jpg)

另一个导航站点：

<!-- ![](https://ipfs.io/ipfs/QmYfBSP66ToswbWvm44JwAYg6jsSrxPS3TrrMzxC2jzX3m?3.jpg) -->

![](https://i.postimg.cc/90wdcKN2/hdwiki.jpg)

其次是某些站点的截图。有军火、Drug、假护照、信用卡

<!-- ![](https://ipfs.io/ipfs/QmcdFpt8HEUsPTGgw9zASrUbNZZCg9pzFuazRBZcPCJoQW?0.jpg) -->

![](https://i.postimg.cc/bY0b90c3/gun.jpg)

<!-- ![](https://ipfs.io/ipfs/QmabaP9oANr2MyKBf9igUJn3pj3KtrTSsYbmaGWXpzUuCa?2.jpg) -->

![](https://i.postimg.cc/TwVyQxSp/fake.jpg)

不过也不是所有站点都是违法犯罪的，也有些画风比较清奇如下图，这说明其实你也完全可以在暗网搭个网站放动画片，不过有没有人看就是另一回事了。

<!-- ![](https://ipfs.io/ipfs/Qmdye3d2Ct3AhAnJUYgLpUTnRtUie2uJkd74gfRvx3PjF7?2.jpg) -->

![](https://i.postimg.cc/q7fMFY2n/ps4.jpg)

## 参考文档

[深网-中文维基](https://zh.wikipedia.org/wiki/%E6%B7%B1%E7%BD%91)  
[Darknet-Wikipedia](https://en.wikipedia.org/wiki/Darknet)  
[Dark\_web](https://en.wikipedia.org/wiki/Dark_web)  
[The Uncensored Hidden Wiki](http://uhwiki36pbooodfj.onion/wiki/index.php/Main_Page)

