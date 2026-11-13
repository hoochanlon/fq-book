# Quantumult X（去手机开屏广告）

##  Quantumult X功能简介

 Quantumult X 最强大的功能是分流规则 (Routing Rules)，分流规则就像是网络世界的“交通警察”。它通过读取您想要访问的网址（域名或 IP），并根据预设的规则表，指挥流量走不同的通道：

- **Direct (直连)**：访问百度、B站等国内网站时，不经过节点，直接连接。
- **Proxy (代理)**：访问 Google、Twitter 时，走您刚才添加的机场节点。
- **Reject (拒绝)**：访问各类广告联盟的网址时，直接拦截，实现去广告的效果。


如果说分流规则是交通警察，那么 Rewrite 和 MITM 就是“网络魔术师”。它们不仅能阻挡请求，还能修改请求的内容。最典型的应用场景就是解锁某些 App 的会员界面、彻底屏蔽 YouTube 的片头广告、或者去除国内毒瘤 App 的开屏广告。

绝大多数现代网站和 App 都使用了 HTTPS 加密传输。如果在没有授权的情况下，圈X无法看到加密流量里的具体内容，自然也就无法进行修改或去广告。 **MITM (Man-in-the-Middle，中间人)** 技术就是让圈X生成一个安全的本地证书。当你信任这个证书后，圈X就能解密您指定的网络请求，执行脚本修改后再重新加密发给服务器。这是实现高级去广告的关键。

银行类 App 对证书非常敏感，如果检测到网络被“中间人”劫持（哪怕是我们自己为了去广告设置的），就会拒绝连接。因此我们需要在 MitM 的主机名 (Hostname) 列表中，放行这些 App 的域名，或者直接在分流规则中将这些支付 App 的域名设置为 `Direct` 且跳过 MitM。

## 下载与安装 Quantumult X

Quantumult X 并未在中国的 App Store 上架。因此，在配置之前，我们需要完成软件的获取。你需要一个美区 (US)、港区 (HK) 或台区 (TW) 的 Apple ID。如果你还没有，可以参考 [美区ID购买小火箭](https://hoochanlon.github.io/fq-book/#/fkca/apple-ssr?id=美区id购买小火箭)注册美区ID。

美区ID注册好后，在咸鱼、淘宝上购买美区礼品卡，然后兑换礼品，购买并下载 Quantumult X。

> [!important]
> **注意事项**：登录外区账号时，请只在 App Store 登录，**千万不要在手机的“设置 -> iCloud”中登录**！

兑换礼品码操作如图：

![](https://i.postimg.cc/pV4hzhqq/wei-xin-tu-pian-20261114000308-3415-40.jpg)

![](https://i.postimg.cc/1XqzJBvR/wei-xin-tu-pian-20261114000306-3414-40.jpg)

![](https://i.postimg.cc/kXSsLt4Y/wei-xin-tu-pian-20261114000304-3413-40.jpg)

下载 Quantumult X

![](https://i.postimg.cc/1Rkc05HJ/wei-xin-tu-pian-20261113205827-6665-1021.jpg)


## 使用 Quantumult X

打开软件点击风车图标

![](https://i.postimg.cc/VL5vNjnf/Screen-Shot-2026-11-14-003758-881.png)

下滑到看见【下载配置】选项，并点击

![](https://i.postimg.cc/DwL2W5z6/Screen-Shot-2026-11-14-003948-347.png)

自己一条条写规则是不现实的。好在互联网上有众多开源的大神维护着极其完善的规则库，新手只需引用这些规则集即可。相关规则链接如下：

* https://ddgksf2013.top/Profile/QuantumultX.conf
* https://github.com/blackmatrix7/ios_rule_script

填入 `https://ddgksf2013.top/Profile/QuantumultX.conf` 并确定。

![](https://i.postimg.cc/GpMhrtt4/Screen-Shot-2026-11-14-004251-062.png)

接着在软件的右上角点击启用，并等待一段时间的设置规则加载更新，更新后的效果图如下

![](https://i.postimg.cc/xCy5crrV/Screen-Shot-2026-11-14-004928-601.png)

接着就是看延迟选择相关节点，在自动选择上查看延迟，在临时使用上选择相关节点

![](https://i.postimg.cc/SNX9P0Z9/wei-xin-tu-pian-20261114005213-56-2.jpg)

![](https://i.postimg.cc/s23vsbJ4/wei-xin-tu-pian-20261114005212-55-2.jpg)

最后就可以打开相关手机app查看去广告的效果了，不过这会使网络变慢。建议去完广告后关闭Quantumult X，只在想要去开屏广告时再开启。

 
