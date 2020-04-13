# VPN隧道协议

> 原文：[VPN隧道协议](https://blog.csdn.net/cymm_liu/article/details/16889457)&emsp;作者：[长眼慢慢](https://blog.csdn.net/cymm_liu)

**整理自网络：**

VPN \(虚拟专用网\)发展至今已经不在是一个单纯的经过加密的访问隧道了，它已经融合了访问控制、传输管理、加密、路由选择、可用性管理等多种功能，并在全球的 信息安全体系中发挥着重要的作用。也在网络上，有关各种VPN协议优缺点的比较是仁者见仁，智者见智，很多技术人员由于出于使用目的考虑，包括访问控制、 安全和用户简单易用，灵活扩展等各方面，权衡利弊，难以取舍;尤其在VOIP语音环境中，网络安全显得尤为重要，因此现在越来越多的网络电话和语音网关支 持VPN协议。

目前比较常见的VPN隧道协议有[PPTP VPN](http://web.xieshenglin.com/tag/pptp-vpn/)、[L2TP  VPN](http://web.xieshenglin.com/tag/l2tp-vpn/)、[OpenVPN](http://web.xieshenglin.com/tag/openvpn/)、[SSH代理](http://web.xieshenglin.com/tag/ssh/)等多种协议选择，可在不同的平台和环境下使用。每一种协议均有独特的功能和优势。在选择使用哪种协议时，需要考虑你的设备支持什么协议，在安全性和速度之间权衡，以及有没有协议被你的网络阻塞。

PPTP、L2TP、OpenVPN三种隧道协议的优缺点对比：（SSH不列入比较）：

* 易用性：
    * PPTP &gt; L2TP &gt; OpenVPN

* 速度：
    * PPTP &gt; OpenVPN UDP &gt; L2TP &gt; OpenVPN TCP

* 安全性：
    * OpenVPN &gt; L2TP &gt; PPTP

* 稳定性：
    * OpenVPN &gt; L2TP &gt; PPTP

* 网络适用性：
    * OpenVPN &gt; PPTP &gt; L2TP

下面简单介绍下PPTP、L2TP、OpenVPN、SSH协议的特点：

1. PPTP VPN协议

    PPTP协议是点对点隧道协议，其将TCP控制包与数据包分开，适合在没有墙限制的网络中使用。

2. L2TP VPN协议

    L2TP是国际标准隧道协议，它结合了PPTP协议以及第二层转发L2F协议的优点，能以隧道方式使PPP包通过各种网络协议，包括ATM、SONET和帧中继。但L2TP没有任何加密措施，更多是和IPSec协议结合使用提供隧道验证。

    支持PPTP的设备基本都支持L2TP，设置略复杂，需要选择L2TP/IPSec PSK方式且设置预共享密钥PSK

    L2TP使用UDP协议，一般可穿透防火墙，适合在有防火墙限制的局域网用户，如公司、网吧、学校场合等使用；PPTP和L2TP二个连接类型在性能上差别不大，如果使用PPTP不正常，那就更换为L2TP。

3. OpenVPN隧道协议

    OpenVPN是一个基于SSL加密的纯应用层VPN协议，是SSL VPN的一种，支持UDP与TCP两种方式。UDP和TCP是2种通讯协议，这里通常UDP的效率会比较高，速度也相对较快。所以尽量使用UDP连接方式，实在UDP没法使用的时候，再使用TCP连接方式。

    由于其运行在纯应用层，避免了PPTP和L2TP在某些NAT设备后面不被支持的情况，并且可以绕过一些网络的封锁（通俗点讲，基本上能上网的地方就能用OpenVPN）。

    OpenVPN客户端软件可以很方便地配合路由表，实现不同线路（如国内和国外）的路由选择，实现一部分IP走VPN，另一部分IP走原网络。

    目前已被GFW用流量特征识别等技术手段侦测并受到严重封杀

4. SSH隧道协议

    SSH原本用于UNIX类系统的远程登录和管理。由于SSH可以通过客户端软件，在本地做一个SOCKS代理进行加密转发，因此也被用于网络代理。

    一些人喜欢用SSH的代理，配合浏览器插件（如Firefox的AutoProxy，Chrome的Switchy）和自动列表，可实现对不同网址有选择性地代理。