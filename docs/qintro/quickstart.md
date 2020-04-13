# 快速开始

## 速成索引

!> 首先，**`了解必要的proxy、VPN软件配置与使用方式`**，接着 **`使用web代理访问提供服务器的网站获取节点`** 或是 **`离线安装Chrome代理插件并访问该站获取节点`**，再结合 **`方法论`** 配置代理或VPN软件进行科学上网

**<details><summary><font size="4">掌握必要的代理配置及 VPN 的使用</font></summary>** 

  * [SS/SSR](proxy/ss-ssr.md)
  * [v2ray](proxy/v2ray.md)
  * [SSH-Tunnel](proxy/SSH-Tunnel.md)
  * [网页代理的使用](web/web-proxy.md)
  * [典型VPN概览](vpn/classical-vpn.md)
  * [opera](browse/opera.md)（注意示例中以压缩包的形式安装Chrome插件）

</details>

**<details><summary><font size="4">方法论</font></summary>** 

  * [获取梯子上网的方式](method/get-method.md)

</details>

?> 快速开始仅为速成互联，关于科学上网的细节原理等各方面的解释，可参考书中科学普及与细节补充等相关章节


## 速成示例

速成示例作业站点由 [WebOutlook](https://github.com/hoodiearon/WebOutlook) 提供支持

![](https://i.postimg.cc/Fz2bDWSs/Snipaste-2019-07-01-04-27-55.png)

### chrome 离线安装代理扩展插件

借助 [173app](https://173app.com) 下载 [skyzip](https://173app.com/apps/hbgknjagaclofapkgkeapamhmglnbphi) 

![](https://i.postimg.cc/jq4Q0cr9/Snipaste-2019-07-01-03-43-31.png)

将下载好的插件 `.crx` 格式改为压缩格式 `.zip` 并解压

![](https://i.postimg.cc/brnvP3Z5/Snipaste-2019-07-01-03-51-18.png)

在`开发者模式` 选中 `加载已解压的扩展程序` 即可

![](https://i.postimg.cc/hjzCSdcw/hasi9.png)

打开扩展开关并点亮 skyzip 成绿色

![](https://i.postimg.cc/ht2rS7yz/Snipaste-2019-07-01-04-12-46.png)

测试

![](https://i.postimg.cc/PqGqvSFB/Snipaste-2019-07-01-04-15-42.png)


### free-ss.site 节点导入影梭

先在 [github](https://github.com/) 上搜索 `shadowsocks-windows` 并下载此代理软件；win7需要下载此类框架运行环境，win10自带。

![](https://i.postimg.cc/dtxRWXJR/Snipaste-2019-07-01-02-52-33.png)

利用 skyzip 打开 https://free-ss.site

![](https://i.postimg.cc/zfxpz271/Snipaste-2019-07-01-04-54-26.png)


也可借助 [jsproxy](https://github.com/EtherDream/jsproxy/) 项目提供的 [web代理网址](https://jsproxy.ga/)，在此基础上又嵌套一个web代理 [croxyproxy](https://www.croxyproxy.com/) ，用以加载爱国上网服务器网站节点信息。

<details><summary> 嵌套操作 </summary>

?> 嵌套的原因是：虽然有些web代理没被墙，但并不会完全加载各个网站的相关脚本等其他代码，所以就用到其他web代理（也有很多被墙的）作为嵌套使用。

![](https://i.postimg.cc/7YsJHTcq/new11.png)

</details>

`鼠标 Shadowsocks 右键 -> 服务器 -> 扫描二维码` 添加节点服务器

![](https://i.postimg.cc/15vSbGdr/Snipaste-2019-07-01-00-03-43.png)

配置地址:`127.0.0.1` 端口:`1080` 并确定

![](https://i.postimg.cc/MHvGF9YN/Snipaste-2019-07-01-03-21-10.png)

将 `系统代理` 开启并测试

![](https://i.postimg.cc/K8qTfcMv/Snipaste-2019-07-01-04-44-42.png)

### tunsafe 导入配置作业

进入[tunsafe官网](https://tunsafe.com/)，可以看到此外它还提供独立的虚拟网卡和软件（集合安装器需要全局翻墙环境），然后下载并安装这两个文件。

![](https://i.postimg.cc/1XRCdppx/20190607083401.png)

安装很简单，默认就行；注意勾选下始终信任项目就好了。

![](https://i.postimg.cc/Z5LLG954/20190607083553.png)

在 `user guide` 选择 `using tunsafe windows`接着再选择`free vpn servers`

![](https://i.postimg.cc/7LKsW3r8/20190606205200.png)

点击 `create new account`，选择服务器，然后生成下载该配置文件，**建议下载多个配置文件测试连接效果**。

![](https://i.postimg.cc/63NrzTyJ/20190606205536.png)

打开软件在`File`项中选择`browse in explorer` 就会打开软件配置目录源

![](https://i.postimg.cc/hv8Qj0rf/Snipaste-2019-06-06-21-11-36.png)

将下载好的conf导入到该目录

![](https://i.postimg.cc/SRYVwsqj/20190607092202.png)

如果连接不上，那换一个服务器连接测试，即可

!> 也有可能存在恶意禁用的问题，详情请看：[简谈国产杀软 - 恶意禁用连接互联网服务问题](append/guochan-sharuan?id=恶意禁用连接互联网服务问题)

![](https://i.postimg.cc/T3RbDfrP/Snipaste-2019-06-07-08-54-24.png)
