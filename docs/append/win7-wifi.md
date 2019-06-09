# 用Win7，电脑就是路由器

> 原文：[用Win7，电脑就是路由器](http://blog.sina.com.cn/s/blog_6286984e0100kujt.html) 作者：[微软Windows的博客](http://blog.sina.com.cn/s/blog_6286984e0100kujt.html)

在平常上网过程中，难免会遇到一些网络方面的问题，这时候我们就需要查看网络连接的状态，查找问题根源。

<!-- ![](https://ipfs.io/ipfs/QmQtXLa5xLbqNsdv82cVYJA8hE9greNXR34FUfkENjoDND?4.jpg) -->

![](https://i.postimg.cc/tCYPPsyg/a12d690.jpg)    
在WinXP中，大家这时候都会从开始菜单或控制面板打开“网络连接”窗口来检查网络问题，但对于一个Win7新手来说，找到这个窗口似乎有点困难，在控制面板中搜索“网络连接”也找不到它。这时候，大家应该想到的就是上次介绍过的“网络和共享中心”，因为这里集中了网络相关的常规配置，在这里能不能找到线索呢？

试试点击左上方的“更改适配器设置”任务吧，瞧，“网络连接”窗口原来藏在这里，这时候我们就可以和XP中一样查看到计算机中网卡的设置和状态了：

<!-- ![](https://ipfs.io/ipfs/QmPQopQc63jx7VJ6x5DVzAShK3XbfsDLA2ZMictCSdWMcx?0.jpg)   -->

![](https://i.postimg.cc/Nf3yHbpN/e88p690.jpg) 

但有的同学可能会发现，在这些网卡当中多了一个叫“Microsoft Virtual WiFi Miniport Adapter”的东西，按名字来看似乎是微软的虚拟Wifi网卡。电脑中怎么会无缘无故多了这么一个东西呢？难道又一个Win7的隐藏功能被发现啦？

没错，这的确是Win7中深藏不漏的新功能——“虚拟Wifi”，不好意思在前面给大家卖了很大一个关子。简单来说，Win7能在现有无线网卡的基础上再虚拟出一块无线网卡，支持网络共享，让我们的电脑变成无线路由器哦！看来如今“虚拟”真是无处不在啊。

有的同学可能知道，在此之前，其实也可以建立临时网络向其他Wifi设备共享互联网啊，虚拟 Wifi 网卡有什么新的优势呢？

<!-- ![](https://ipfs.io/ipfs/QmbDefgaVGHeDwmMdbS4BGi27r8wpYNwzNHJZpWWUBXTQJ?0.jpg)   -->

![](https://i.postimg.cc/Jz3hB8yn/a3et690.jpg) 

传统的临时无线网（即Ad Hoc模式）是一种点对点网络，类似于有线网中的“双机互联”，虽然也能实现互联网共享，但主要用于两个设备临时互联，并且有的设备（如采用Android系统的设备）并不支持连接到临时无线网。还有一个很严重的问题，由于一块无线网卡只能连接到一个无线网络，因此如果通过无线网卡连接到Internet，就不能再使用这个无线网卡建立临时网络，共享Internet了。

而Win7中的虚拟Wifi功能可以在一块真实无线网卡基础上再虚拟出一块网卡，实现无线路由器的 AP功能，解决了临时网络的所有问题。

这么诱人的功能，现在赶紧教给大家：

1. **以管理员身份运行命令提示符**

    因为下面的步骤必须在管理员权限下运行，因此我们从开始菜单找到“命令提示符”，或直接键入cmd快速搜索，右键单击它，选择“以管理员身份运行”，在弹出的用户控制窗口中单击“是”。还有一种方法就是按住Ctrl和Shift键直接单击该快捷方式，更简单哦。

2. **启用并设定“虚拟Wifi网卡”模式**

    运行以下命令启用虚拟无线网卡（相当于打开路由器）：

    `netsh wlan set hostednetwork mode=allow ssid=”Win7 AP WOW!” key=wifimima`

    <!-- ![](https://ipfs.io/ipfs/QmaMeEgS3zw7VeCXrcxAyRdiQPhynYVaanbWJT6Q1Y2bYo?1.jpg)  -->
    
    ![](https://i.postimg.cc/9QB7HZYJ/cd41e690.jpg) 

    这个命令中有三个参数：

     * Mode：是否启用虚拟Wifi网卡，改为`disallow`则为禁用，虚拟网卡即会消失。

     * Ssid：指定无线网络的名称，最好为英文。

     * Key：指定无线网络的密码。该密码用于对无线网进行安全的WPA2加密，能够很好的防止被蹭网。

3. **启用“Internet连接共享（ICS）”**

    为了与其他计算机或设备共享已连接的互联网，我们需要启用“Internet连接共享”功能。打开“网络连接”窗口，右键单击已连接到Internet的网络连接，选择“属性”，切换到“共享”选项卡，选中其中的复选框，并选择允许其共享Internet的网络连接在这里即我们的虚拟Wifi网卡：

    ![](https://i.postimg.cc/jSvLFKR1/d1de690.jpg)
    
    确定之后，提供共享的网卡图标旁会出现“已共享”标志，表示“Internet连接共享”向虚拟无线网卡开通了：
    
    ![](https://i.postimg.cc/5tYbSMyL/e2f690.jpg)

4. **开启无线网络**

    继续在命令提示符中运行以下命令：

    `netsh wlan start hostednetwork`

    即可开启我们之前设置好的无线网络（相当于打开路由器的无线功能。同理，将start改为stop即可关闭该无线网）。

    <!-- ![](https://ipfs.io/ipfs/QmZGdo9UjyEKx5v3pSzKaTvTeFonGRwVs6wR7NdXinfraw?0.jpg) -->

    ![](https://i.postimg.cc/ZKMQFvds/et6ae690.jpg)

    可以看到，虚拟无线网卡已经开启了我们所指定的无线网络，其IP地址等属性是由“Internet连接共享”服务分配的，因此比较特别：

    <!-- ![](https://ipfs.io/ipfs/QmSykUE1kpTVbUiiGnn3QoSyokGfpsTR7mwSE3HiSTr1SL?4.jpg) -->

    ![](https://i.postimg.cc/Qtfm8vgY/c17ec690.jpg)

    一切准备就绪，最后只要在需要联网的的电脑或手机上连接该无线网络，就可以直接畅游互联网了：

    <!-- ![](https://ipfs.io/ipfs/QmR3wMDpsf4MngKbRWuiw8s8BAednxzGWhUcCpqy3tn2Ed?1.jpg) -->

    ![](https://i.postimg.cc/RZmgT10R/dcd690.jpg)
    
需要多说一点的是，虚拟Wifi网卡需要真实网卡的驱动程序专门针对Windows 7设计开发。所幸只要通过Win7徽标认证的无线网卡驱动程序都支持该模式，我们在选购无线网卡时直接寻找是否带有该标志即可。如果在运行`mode=allow`命令后，网络连接中没有出现虚拟无线网卡，就说明真实网卡不支持该功能。大家可以将网卡驱动升级到最新的Win7版本试试看，只要提供共享的电脑不休眠不关机，就可以和路由器一样提供网络共享。

除了使用命令设置虚拟WIFI功能，微软还将其编程接口公开了出来，为开发图形化设置程序提供了可能，例如免费小软件Connectify就能直观的设置虚拟Wifi功能，同学们可以在其官方网站下载使用：[www.connectify.me](http://www.connectify.me/)


<!--分别替换启用“Internet连接共享（ICS）的图片即可  -->
<!-- ![](https://raw.githubusercontent.com/hoodiearon/fq-book/master/docs/images/d1de690.jpg)-->

<!-- ![](https://raw.githubusercontent.com/hoodiearon/fq-book/master/docs/images/e2f690.jpg) -->


<!-- ipfs 启用“Internet连接共享（ICS）的图片-->
<!-- ![](https://ipfs.io/ipfs/QmQkAtXoff2tp8uiRbpGNwAA4hTbCqm8uRGjXmayWP1RcN?4.jpg)   -->

 <!-- ![](https://ipfs.io/ipfs/QmagdtNek1pwCGB6syXtf46WY6MuJFcrJieS9W623NFUik?0.jpg) -->