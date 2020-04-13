# VMware的3种网络模式

> 原文：[根本区别在哪里 VMware的3种网络模式](http://net.zol.com.cn/115/1158058.html)&emsp;作者：孙鹏

## 桥接模式

桥接网络是指本地物理网卡和虚拟网卡通过VMnet0虚拟交换机进行桥接，物理网卡和虚拟网卡在拓扑图上处于同等地位（虚拟网卡既不是Adepter VMnet1也不是Adepter VMnet8）。

桥接网络拓扑图

<!-- ![](https://ipfs.io/ipfs/QmaM994hn7RC2gT8qd3ubxqrTiURzsUrhYCwu2JJc68ERN?3.png) -->

![](https://i.postimg.cc/D0m3YyN6/2018-05-13-161016.png)

那么物理网卡和虚拟网卡就相当于处于同一个网段，虚拟交换机就相当于一台现实网络中的交换机。所以两个网卡的IP地址也要设置为同一网段。

物理网卡IP地址

<!-- ![](https://ipfs.io/ipfs/QmTksR6g9wBZptxJzXcVspXtzUppUFfSj9d5W2k74iGWv8?3.png) -->

![](https://i.postimg.cc/zBccvwdw/2018-05-13-161401.png)

虚拟网卡IP地址

<!-- ![](https://ipfs.io/ipfs/QmemKU954PgTQaBQ4jg3Wa8A7tk74wAAHf4XLEpMiqg1ZW?4.png) -->

![](https://i.postimg.cc/ZRHyxVk3/2018-05-13-161708.png)

我们看到，物理网卡和虚拟网卡的IP地址处于同一个网段，子网掩码、网关、DNS等参数都相同。两个网卡在拓扑结构中是相对独立的。

ping结果

<!-- ![](https://ipfs.io/ipfs/QmcwWPpLZXN7yU5KmPgA9pJNV3gPefNH3ot87GjDQxZUUp?3.png) -->

![](https://i.postimg.cc/Gpr2gGxj/2018-05-13-161826.png)

我们在192.168.15.111上ping192.168.15.96，结果显示两个网卡能够互相通信。如果在网络中存在DHCP服务器，那么虚拟网卡同样可以从DHCP服务器上获取IP地址。所以桥接网络模式是VMware虚拟机中最简单直接的模式。安装虚拟机时它为默认选项。

## NAT模式

在NAT网络中，会用到VMware Network Adepter VMnet8虚拟网卡，主机上的VMware Network Adepter VMnet8虚拟网卡被直接连接到VMnet8虚拟交换机上与虚拟网卡进行通信。

NAT网络模式拓扑图

<!-- ![](https://ipfs.io/ipfs/QmT4kUS8cMC7g9VoZMmro4rf3vjRc84f6MagkYuZQcmY3u?2.png) -->

![](https://i.postimg.cc/zvjZBHgq/2018-05-13-162012.png)

VMware Network Adepter VMnet8虚拟网卡的作用仅限于和VMnet8网段进行通信，它不给VMnet8网段提供路由功能，所以虚拟机虚拟一个NAT服务器，使虚拟网卡可以连接到Internet。在这种情况下，我们就可以使用端口映射功能，让访问主机80端口的请求映射到虚拟机的80端口上。

VMware Network Adepter VMnet8虚拟网卡的IP地址是在安装VMware时由系统指定生成的，我们不要修改这个数值，否则会使主机和虚拟机无法通信。

NAT虚拟网卡IP地址

<!-- ![](https://ipfs.io/ipfs/Qmd2KUrSiviXCv34mUha2dfV7MzSbGi9foPm5yiKK7ATF1?4.png) -->

![](https://i.postimg.cc/63JDffV9/2018-05-13-162216.png)

物理网卡IP地址

<!-- ![](https://ipfs.io/ipfs/QmXWg73AiRBuE5i2auxwPicmfYUwsnFd4GhbH1qGuhhDxi?3.png) -->

![](https://i.postimg.cc/sXLGL1XD/2018-05-13-162302.png)

虚拟出来的网段和NAT模式虚拟网卡的网段是一样的，都为192.168.111.X，包括NAT服务器的IP地址也是这个网段。在安装VMware之后同样会生成一个虚拟DHCP服务器，为NAT服务器分配IP地址。

当主机和虚拟机进行通信的时候就会调用VMware Network Adepter VMnet8虚拟网卡，因为他们都在一个网段，所以通信就不成问题了。

实际上，VMware Network Adepter VMnet8虚拟网卡的作用就是为主机和虚拟机的通信提供一个接口，即使主机的物理网卡被关闭，虚拟机仍然可以连接到Internet，但是主机和虚拟机之间就不能互访了。

## 仅主机模式

在Host-Only模式下，虚拟网络是一个全封闭的网络，它唯一能够访问的就是主机。其实Host-Only网络和NAT网络很相似，不同的地方就是Host-Only网络没有NAT服务，所以虚拟网络不能连接到Internet。主机和虚拟机之间的通信是通过VMware Network Adepter VMnet1虚拟网卡来实现的。

host-only模式拓扑图

<!-- ![](https://ipfs.io/ipfs/QmdsKse5xP3BRDMy7dGQPWmGNcCrFF9RVYtgyYzPVPqoE9?1.png) -->

![](https://i.postimg.cc/0yvnnXFX/2018-05-13-162359.png)

同NAT一样，VMware Network Adepter VMnet1虚拟网卡的IP地址也是VMware系统指定的，同时生成的虚拟DHCP服务器和虚拟网卡的IP地址位于同一网段，但和物理网卡的IP地址不在同一网段。

 Host-Only虚拟网卡IP地址

<!-- ![](https://ipfs.io/ipfs/QmeBhyZXNcraRFGp2evnAK74NRSYNpgKgeo2g5M26mG63g?2.png) -->

![](https://i.postimg.cc/8zwRHphs/2018-05-13-162504.png)

物理网卡IP地址

<!-- ![](https://ipfs.io/ipfs/QmUn6ZwscVPmigSNfxABezVX8A3Qeekqt7Ss4pDGYKGrR7?0.png) -->

![](https://i.postimg.cc/LXjhxDrv/2018-05-13-162617.png)

Host-Only的宗旨就是建立一个与外界隔绝的内部网络，来提高内网的安全性。这个功能或许对普通用户来说没有多大意义，但大型服务商会常常利用这个功能。如果你想为VMnet1网段提供路由功能，那就需要使用RRAS，而不能使用XP或2000的ICS，因为ICS会把内网的IP地址改为192.168.0.1，但虚拟机是不会给VMnet1虚拟网卡分配这个地址的，那么主机和虚拟机之间就不能通信了。

## 综述

在VMware的3中网络模式中，NAT模式是最简单的，基本不需要手动配置IP地址等相关参数。至于桥接模式则需要额外的IP地址，如果是在内网环境中还很容易，如果是ADSL宽带就比较麻烦，ISP一般是不会大方地多提供一个公网IP的。

