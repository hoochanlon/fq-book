# NAT类型科普及一些简单提升方法

> 原文：[NAT类型科普及一些简单提升NAT类型的方法](http://www.right.com.cn/forum/thread-199299-1-1.html)&emsp;作者：iSkyun

首先百度了解到什么是“[**NAT**](http://baike.baidu.com/item/nat)”，看了那么多我们大概也知其一些的基本知识，比如说[**定义**](http://baike.baidu.com/item/nat)、[**功能**](http://baike.baidu.com/item/nat#1)、[**实现方式**](http://baike.baidu.com/item/nat#2)及[**类型**](http://baike.baidu.com/item/nat#7)
  
提升NAT类型的好处：  

* 浏览网页、观看视频、游戏等更顺畅，下载速度更稳定快速，  
* 特别是对那些玩ED2K/PT下载、PS4/XBox主机游戏的，  
* 提升NAT类型后更有可能获取到HigtID、更容易进入游戏房间连线等。  
  
要提升NAT类型，我们必须知道NAT的4个类型它们分别对应：  

* **NAT1 **→ **Full Cone**&emsp;  NAT1这是最宽松的网络环境，你想做什么
* **NAT2 **→ **Address-Restricted Cone** &emsp;浏览网页与游戏及下载都没过多限制
* **NAT3 **→ **Port-Restricted Cone** &emsp;同上，但游戏厂商会限制此NAT类型的联机
* **NAT4 **→ **Symmetric** &emsp;这是最严格的网络环境，可能会玩不了游戏、下载都没速度
  
说些比较重要的前话，路由器少一层是一层，这样越有可能得到NAT1和NAT2这两类NAT类型，一般建议家里的网路是以下两种拓扑类型：  
1. 光猫桥接→主路由（拨号连接外网用）→副路由（纯AP模式，扩展信号）  
2. 光猫拨号（直接充当主路由）→副路由（纯AP模式，扩展信号）  

这样的好处是桥接和纯AP是不进行NAT的，而是SWitch，所以不会导致多一层NAT。
  
现在个别网络游戏严格要求你的网络环境必须是**NAT2**或以上才能进行游戏。而你的网络环境又是NAT3及NAT4,那到底该怎么办呢？下面我们介绍一些简单提升NAT类型的方法，其实就是进行[**NAT穿透**](http://baike.baidu.com/item/nat#3_3)

* 路由器有启用**Full Cone、STUN、TURN、ICE、uPnP**等功能都果断启用了；若没有该换了，因为**uPnP**基本是标配

* 一般建议有Full Cone、uPnP等就不要开DMZ了，除非你是PS4/XBox这类游戏主机要提升NAT类型

* 如果没有以上功能，那可以找下有没有**[DMZ](http://baike.baidu.com/item/dmz)**功能并启用它，将你要提升NAT类型的主机IP地址设置好。

* 在Windows上把以下三个服务设置为自动启动，并启动该服务：   

    * SSDP Discovery  
    * Function Discovery Provider Host  
    * Function Discovery Resource Publication  
  
* 在Windows防火墙，放行你需要提升NAT类型的软件或者游戏程序，也可以直接关闭

* 如果你的设备是通过电脑共享网络的形式上网的，建议把这个服务也打开：
    
    * UPnP Device Host  

以上能弄的都弄了，网络环境就会越好甚至NAT1都没有问题。这是我通过以上设置，进行NAT穿透+公网IP一枚。

测得的结果： 

![](https://i.postimg.cc/NFMFQtKC/132059dd4rfiilqz4e4s4p.jpg)

<!-- ![](https://ipfs.io/ipfs/QmZNLVAGW4wUrd1qpRKhj4JzXei9PhKJ7z9HTnjvp3qYbw?0.jpg)    -->

<!-- ![](http://www.right.com.cn/forum/data/attachment/forum/201611/10/132059dd4rfiilqz4e4s4p.jpg)   -->
最后附上NAT类型测试工具：  

![](https://i.postimg.cc/257n6z5C/zip.gif) [NAT类型测试.zip](http://down7.pc6.com/xy3/NatTypeTester.zip) 

<!-- ![](http://www.right.com.cn/forum/static/image/filetype/zip.gif) [NAT类型测试.zip](http://www.right.com.cn/forum/plugin.php?id=imc_attachad:ad&aid=MTQzODYzfDQxMGQxODFmfDE1MjU4MzkxMjZ8MHwxOTkyOTk%3D)  -->
PS:  
如果能找运营商要到外网IP，这是最好的；没有公网IP的话，可以打电话给客服态度强硬点、最好一开始就把客服的工号也要了并说“我家宽带怎么没公网IP啊，我需在家里装远程监控，没有公网IP的话不行，如果不给我公网IP，我只好退宽带换别家的了，不给就投诉你”；但如果还是要不到公网IP，能提升到NAT2也不错了。

还有一种最笨的就是直接电脑拨号上网，Windows 直接把防火墙关了，只要你的是公网IP，妥妥的NAT1。想要提升PS4/XBox这类游戏主机的NAT类型，建议以上能做的都做了。    
  


