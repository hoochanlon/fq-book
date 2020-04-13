# 宿主机使用VM的代理


!> 虚拟机使用宿主机代理，不用设置额外VMware的转发，只需添加代理的地址与端口<br>
手机也能使用虚拟机所配置的本机代理服务器，不需要同宿主机设置专属的VMware转发<br>
除默认配置的仅主机模式外，宿主机使用VPN会影响全局网络，虚拟机可以直接访问互联网<br>
虚拟机采用的是非全局性的独立网络，也因此在虚拟机使用VPN并不能使宿主机也能够访问互联网

在NAT模式中，虚拟机通过宿主机器所在的公网网络来访问互联网（目前在墙内），vm使用代理软件转发端口监听任意地址，主机在代理中配置同一公网内的局域网IP与端口，完成网络之间的互联共享。以下是具体实例：

在NAT模式中不考虑使用VPN或代理的情况下，IP地址是完全一致的

<!-- ![](https://ipfs.io/ipfs/QmPgX1CEGGAkCGiG6eD5ujWysQ9iBhV2iTqn8hNmZV4upT?2.png) -->

![](https://i.postimg.cc/y6nWLsnS/2018-05-13-005931.png)

在vm中开启v2ray以及配置privoxy相关参数`0.0.0.0:8118`监听任意地址开启的`8118`端口，将所有http流量再转发至本机代理

<!-- ![](https://ipfs.io/ipfs/QmVvZ3tL2jX5NizhrctG7FFFBDYJVDu3pbgB8JGDrrduvj?2.png) -->

![](https://i.postimg.cc/2SnDXxmX/2018-05-12-065612.png)

在vm设置代理本机地址与privoxy代理的监听端口

<!-- ![](https://ipfs.io/ipfs/QmZHt9U6eiYkSrjiU3npR7pCuTi8HVTcEFGy26p5uY9JU7?1.png) -->

![](https://i.postimg.cc/rFrXK9dF/2018-05-13-013525.png)

查看vm局域网地址

<!-- ![](https://ipfs.io/ipfs/QmPPBiFHzDh7crMrLCfvDc9f6B5v13P4zygPhdDhBxg2Wj?0.png) -->

![](https://i.postimg.cc/wBT9ym8f/2018-05-13-014622.png)

VMware设置端口映射

<!-- ![](https://ipfs.io/ipfs/QmZhNJ9bMbuSp9DSPpZHyzmkbBD3DAZNLKqdAYNLhh4814?1.png) -->

![](https://i.postimg.cc/fy44K3ph/2018-05-13-0153pxcx.png)

宿主机中设置代理，填入vm的IP地址与端口

<!-- ![](https://ipfs.io/ipfs/QmTJ8f5AAMX3ak1u78sBXPzYyBUTVoxwSYfsy4ixfcdnKT?2.png) -->

![](https://i.postimg.cc/P57SZg0g/2018-05-13-02xsdf.png)

测试

<!-- ![](https://ipfs.io/ipfs/QmaREa4sCZgTLZ7xqdUh45TuSieGbtyvHp6P9JXGRkqv9Q?2.png) -->

![](https://i.postimg.cc/bJ906WFN/2018-05-13-021830.png)




