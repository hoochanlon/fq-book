# meek网桥的技术原理

> 转载自[网络](https://www.google.com/search?q=meek%E6%B5%81%E9%87%8F%E6%B7%B7%E6%B7%86&oq=meek%E6%B5%81%E9%87%8F%E6%B7%B7%E6%B7%86&aqs=chrome..69i57.7285j0j9&sourceid=chrome&ie=UTF-8)，并做了相应修改

首先，tor从使用者本机直到出口节点的传输是强加密的，别人无法偷窥你的真实网络流量。除非tor软件本身出现严重安全漏洞或者碰到的出口节点是[蜜罐](https://baike.baidu.com/item/%E8%9C%9C%E7%BD%90%E6%8A%80%E6%9C%AF/9165942?fromtitle=%E8%9C%9C%E7%BD%90&fromid=5390254)。

虽然无法偷窥你的真实上网内容，但是如果有ISP、GFW监控你的流量，可以判断出你在使用tor，判断流量类型不等于解密内容；而流量混淆把tor流量伪装成其它的上网流量，让监控者看不出你在用tor。

出于软件架构方面的考虑，流量混淆的功能不是做到tor的核心软件中，而是以插件的方式来提供。因为混淆流量的方式是多种多样的，用插件来扩展就无需频繁改动核心模块的代码。

在meek之前，tor开源社区已经出过好几款流量混淆插件。以obfsproxy为例：

<!-- ![](https://ipfs.io/ipfs/QmWbJAtptajEo98PHticEVyGDQewFyEYuq7hv6w9AbE8uh?3.png) -->

![](https://i.postimg.cc/bv8fkjQ6/2018-05-10-164713.png)

图中的tor client和obfsproxy client在你本机，他们要正常工作就需要先连接到obfsproxy server。虽然GFW无法区分被obfsproxy混淆过的流量，但是因为全球的obfsproxy server数量是有限的，GFW可以把所有的obfsproxy server都加入IP黑名单。如此一来，就足以让obfsproxy失效。  
  
meek client也是跟tor client

一起运行在你本机。下面这张是meek的示意图：

<!-- ![](https://ipfs.io/ipfs/QmRD4PGd2W2PotzuukKbMnbU5gHAijrnXzTxpCbUQT5fGq?1.png) -->

![](https://i.postimg.cc/XJJhkNXg/2018-05-10-171318.png)

从图中可以看出，meek跟obfsproxy的主要差异在于meek server 并不是直接暴露出来的。换句话说，你本机不需要直连meek server，而是直接连接云计算平台的服务器。如此一来，即便GFW知道meek server的IP，封杀这些IP也没有意义。

只因aws、azure云计算平台绑定国内各个公司业务较多，GFW又不敢轻易封杀。这就是meek插件可以突破GFW的关键所在。关于更多tor原理细节请搜索：[tor的常见问题解答](https://www.google.com/search?q=TOR+%E7%9A%84%E5%B8%B8%E8%A7%81%E9%97%AE%E9%A2%98%E8%A7%A3%E7%AD%94&oq=TOR+%E7%9A%84%E5%B8%B8%E8%A7%81%E9%97%AE%E9%A2%98%E8%A7%A3%E7%AD%94&aqs=chrome..69i57j69i60.535j0j7&sourceid=chrome&ie=UTF-8)

