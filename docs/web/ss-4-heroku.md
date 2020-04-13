# heroku搭建ss服务器

> **免费配额与限制：**
> * Network Bandwidth/流量: 2TB/month – Soft
> * Shared DB processing/并发数: Max 200msec per second CPU time – Soft
> * Dyno RAM usage/使用运行内存: 512MB – Hard
> * Slug Size/存储空间: 300MB – Hard
> * Request Length/请求时间: 30 seconds – Hard

> 在正确部署的情况下提示Application error，是由于访问量各项配额耗尽而停止服务

 fork！github项目：

* [shadowsocks-heroku](https://github.com/onplus/shadowsocks-heroku)

创建App

<!-- ![](https://ipfs.io/ipfs/QmUXxiPhVKLX446nyc7Z6pdSw8WQ8F1wA37sBnSfC7wCgM?2.png) -->

![](https://i.postimg.cc/NFKxzR93/2018-04-29-195722.png)

起个可用名称，默认美国服务器就行，总之不要选网络有限制国家的服务器

<!-- ![](https://ipfs.io/ipfs/QmUNHKLumDEBb4XdxydVEenRauihPnwuA3bTtcCZKizJZh?1.png) -->

![](https://i.postimg.cc/T3TvZP0k/2018-05-16-013449m.png)

在`deploy`点击github图标，并搜索fork过来的项目名称`shadowsocks-heroku`

<!-- ![](https://ipfs.io/ipfs/Qma4mAJVrjEC8nVKos6Eb44CbKFppJm6fqnB4ieVhyaoVn?0.png) -->

![](https://i.postimg.cc/RVQjQBmw/2018-05-16-014155.png)

点击`Connect`按钮

<!-- ![](https://ipfs.io/ipfs/QmSGRCqZ25Kr9kZCFhetdfTMJgKvYmxEHsCCN53WzmrUhE?1.png) -->

![](https://i.postimg.cc/C5C6Nj3w/2018-05-16-014818.png)

转到`settings`点击` reveal config vars`

<!-- ![](https://ipfs.io/ipfs/QmdvghVLwd7std3mSFauDrdVMv4h4V3mmHvMRKiSvdXq61?2.png) -->

![](https://i.postimg.cc/FR3Prys0/2018-05-16-015444.png)

填入`METHOD`与`KEY`并设置其相关参数，关于各项加密算法请看此章结尾处

<!-- ![](https://ipfs.io/ipfs/QmeaPP1aktxNH297tUu8NCu1eTcQwpZ5TwXQLJLQ4D1hN7?2.png) -->

![](https://i.postimg.cc/50B3dfn3/2018-05-16-020104.png)

回到`deploy`选项

<!-- ![](https://ipfs.io/ipfs/QmWuBvjMhmMK2igG3Y7LjZJcfv7bRysTaCYstxLgq7FVrt?0.png) -->

![](https://i.postimg.cc/QdvkFFzm/2018-05-16-020653.png)

下拉点击`enable automatic deploys`完成后再点击`deploy branch`

<!-- ![](https://ipfs.io/ipfs/QmVVTUPaB96knLXLjcMvF6dRiqrfGxnEn3NLBFe7CNxRGK?2.png) -->

![](https://i.postimg.cc/05ZYpW3b/2018-05-16-020817.png)

此时已经部署成功了

<!-- ![](https://ipfs.io/ipfs/QmRbbbFZmsVLoyTNSHhPrg8CRs5QCdXFedK6fST8H9q1Ri?4.png) -->

![](https://i.postimg.cc/9f3ZWv4N/2018-05-16-021041.png)

[下载相关客户端](https://github.com/onplus/shadowsocks-heroku/releases)

<!-- ![](https://ipfs.io/ipfs/QmdCvNxsKYfuxDSjnrtbu4capqkMuw1TWHP2TPHoJgcnN7?4.png) -->

![](https://i.postimg.cc/59PzHHYz/2018-05-16-021835.png)

下载完成后解压缩，并打开`config.json`配置文件

<!-- ![](https://ipfs.io/ipfs/QmS9CrJeuaAeBVz9eK8SLE4iX4bgMRizucuFkS6Uvd6j8F?2.png) -->

![](https://i.postimg.cc/ZRb9nZJj/2018-05-16-022113.png)

配置`config.json`填入页面生成的地址以及在heroku上设置好的加密与密码参数

<!-- ![](https://ipfs.io/ipfs/QmeYnigQFmkN2AbL2Xbqxnvsjaq57LKuxTesWHkUSRNVkM?3.png) -->

![](https://i.postimg.cc/tCZsYBH0/2018-05-16-022758.png)

再打开`ss-h.exe`与配置chrome代理插件`switchyomega`的各项参数，并应用选项

<!-- ![](https://ipfs.io/ipfs/QmQXAw2mEYqVe5RDnypvkSr61FdWX5kxU2fFndq9UE161Z?1.png) -->

![](https://i.postimg.cc/xC1CYRP4/2018-05-16-023617.png)

再选择已配置好的情景代理模式`proxy`

<!-- ![](https://ipfs.io/ipfs/QmP2RX3fpMDNDqyzqGyJB6nNxWhZH9UsckEzrxuBs4JWHp?1.png) -->

![](https://i.postimg.cc/htRthgrx/2018-05-16-024447.png)

测试

<!-- ![](https://ipfs.io/ipfs/QmXYPPXw95AHRsXPTUndycXNKjyQZQu5F8Zx6ZvBn9CS4E?3.png) -->

![](https://i.postimg.cc/7ZNJkfkb/2018-05-16-025046.png)

加密算法

* rc4
* rc4-md5
* table
* bf-cfb
* des-cfb
* rc2-cfb
* idea-cfb
* seed-cfb
* cast5-cfb
* aes-128-cfb
* aes-192-cfb
* aes-256-cfb
* camellia-256-cfb
* camellia-192-cfb
* camellia-128-cfb

